//  DecisionReactiveProcessDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 21/05/2022
//
//  Default implementation of DecisionReactive processes
//
import Foundation
import Logging

// MARK: - DecisionReactiveProcessDefault
// is executing after representation and it is waiting results of other process
// Decision activity:
//  -choose best action
//  - it could discard action by too slow
//https://mohit-bhalla.medium.com/thread-safety-in-ios-swift-7b75df1d2ba6
//https://zamzam.io/creating-thread-safe-arrays-in-swift/
// https://medium.com/swiftcairo/avoiding-race-conditions-in-swift-9ccef0ec0b26
class DecisionReactiveProcessDefault {
    // TODO: review if it is general or one for each process
    // custom dispatch queues are serial by default
    internal let syncronizeDataQueue = DispatchQueue(label: "syncronizeDataQueue")

    enum Constants {
        static let timeToTakeDecision = 0.1 // sgs
    }
    let model: ProcessModel
    var status: ProcessStatus = ProcessStatusDefault.idle

    // signals access -> syncronize
    // use this variable with signals
    private var signals_ = [Signal]()

    // private use
    private var timer: Timer?
    private var fromLayer: Layer?
    private var startTimeOfProcess: Date?
    
    // weak injections
    var activities: WeakArray<Activity> // activities to decide
    var nextLayers: WeakArray<Layer>
    var processToControl: [Process]

    init(model: ProcessModel, activities: [Activity], processToControl: [Process], nextLayers: [Layer]) {
        self.model = model
        self.activities = activities.weak()
        self.processToControl = processToControl
        self.nextLayers = nextLayers.weak()
    }
}
extension DecisionReactiveProcessDefault {
    static func build(with activities: [Activity], processToControl: [Process], nextLayers: [Layer]) -> DecisionReactiveProcessDefault {
        let processModel = DecisionReactiveProcessModelDefault()

        return DecisionReactiveProcessDefault(model: processModel, activities: activities, processToControl: processToControl, nextLayers: nextLayers)
    }
}
// MARK: syncronize access to signals
extension DecisionReactiveProcessDefault {
    private var signals: [Signal] {
        set (newValue) {
            syncronizeDataQueue.sync() {
                self.signals_ = newValue
            }
        }
        get {
            return syncronizeDataQueue.sync {
                signals_
            }
        }
    }
    
    func append(signal: Signal) {
        syncronizeDataQueue.sync() { [weak self] in
            self?.signals_.append(signal)
        }
    }
    func reset() {
        status = ProcessStatusDefault.idle
        signals_ = [Signal]()
        invalidateTimer()
        startTimeOfProcess = nil

    }
}

extension DecisionReactiveProcessDefault: DecisionReactiveProcess {
    /* execute processToControl and decide which is the best signal to inform to nextLayer
        it can be executed by:
            - fromProcess == RepresentationReactiveProcessDefault
            - fromProcess:
                 case CausalProcess
                 case ReasoningReactiveProcess
                 case LearningReactiveProcess
            -
    */
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process?) {
        reset()
        self.fromLayer = fromLayer
        startTimeOfProcess = Date()

        Logger(label: String(describing: self)).info("exec signal: \(signal) fromProcess: \(fromProcess)")

        DispatchQueue(label: self.queueName).async { [weak self] in
            guard let self = self else { return }
            switch fromProcess {
            case _ where fromProcess is RepresentationReactiveProcessDefault:
                self.mainExec(signal: signal, fromLayer: fromLayer)
                break
            case _ where fromProcess is CausalProcess:
                self.exececutedFromCausal(signal: signal, fromLayer: fromLayer)
            case _ where fromProcess is ReasoningReactiveProcess:
                self.executedFromReasoning(signal: signal, fromLayer: fromLayer)
            case _ where fromProcess is LearningReactiveProcess:
                self.executedFromLearning(signal: signal, fromLayer: fromLayer)
            default: break
            }
        }
         
        /*
            infinite until DecisionActivity return a signal (it controls limit time)
            use Timer to execute each time incrementally
         */
        fireDecision()
        
                
    }
}
// MARK: timer and execDecisionActivity
private extension DecisionReactiveProcessDefault {
    @objc func fireDecision() {
        
        Logger(label: String(describing: self)).info("fireDecision - 1")

        invalidateTimer()
        
        guard let fromLayer = fromLayer else { return }
        
        // check best decision
        if let signal = self.execDecisionActivity() {
            
            Logger(label: String(describing: self)).info("fireDecision - 2  signal: \(signal)")

            if let message = signal.messages.first as? BrainDataDefault {
                Logger(label: String(describing: self)).info("fireDecision - 3 message: \(message.txt)")
            }
            self.nextLayers.forEach {
                if let layer = $0() {
                    layer.signal(signal, fromLayer: fromLayer, fromProcess: self)
                }
            }
            return
        }
        
        initTimer()
    }

    func initTimer() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.timer?.invalidate()
            self.timer = Timer.scheduledTimer(timeInterval: Constants.timeToTakeDecision, target: self, selector: #selector(self.fireDecision), userInfo: nil, repeats: false)
        }
    }
    
    private func invalidateTimer() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.timer?.invalidate()
            self.timer = nil
        }
    }
    
}
private extension DecisionReactiveProcessDefault {
    func mainExec(signal: Signal, fromLayer: Layer) {
        Logger(label: String(describing: self)).info("mainExec\(signal) \(processToControl)")

        self.processToControl.forEach {
            $0.exec(signal: signal, fromLayer: fromLayer, fromProcess: self)
        }

    }
    func exececutedFromCausal(signal: Signal, fromLayer: Layer) {
        Logger(label: String(describing: self)).info("execFromCausal\(signal)")
        // TODO: check if it has enought confidence or it is revolved in other moment?
        append(signal: signal)
    }
    
    func executedFromReasoning(signal: Signal, fromLayer: Layer) {
        
    }
    
    func executedFromLearning(signal: Signal, fromLayer: Layer) {
        
    }
    
    func execDecisionActivity() -> Signal? {
        Logger(label: String(describing: self)).info("execDecisionActivity \(activities.first?())")

        guard let decisionActivity = activities.first?() as? DecisionReactiveActivity else { return nil }
        
        guard let fromLayer = fromLayer else { return nil}
        
        let millisecondsSinceStartedProcess = (startTimeOfProcess?.timeIntervalSinceNow ?? 0) * -1000
        
        return decisionActivity.exec(signals: signals, fromLayer: fromLayer, fromProcess: self, millisecondsSinceStartedProcess: millisecondsSinceStartedProcess)
    }
}
// MARK: - needed implementations
struct DecisionReactiveProcessModelDefault: ProcessModel {
    
}
