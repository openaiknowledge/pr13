//  LearningReactiveProcessDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 21/05/2022
//
//  Default implementation of LearningReactive processes
//
import Foundation

// MARK: - LearningReactiveProcessDefault
class LearningReactiveProcessDefault {
    let model: ProcessModel
    var status: ProcessStatus = ProcessStatusDefault.idle
    // weak injections
    var activities: WeakArray<Activity> // activities to decide
    var nextLayers = WeakArray<Layer>() // empty
    var nextProcess: WeakArray<Process>
    

    init(model: ProcessModel,activities: [Activity], nextProcess: [Process]) {
        self.model = model
        self.activities = activities.weak()
        self.nextProcess = nextProcess.weak()
    }
}

extension LearningReactiveProcessDefault {
    static func build(with activities: [Activity], nextProcess: [Process]) -> LearningReactiveProcessDefault {
        let processModel = LearningReactiveProcessModelDefault()

        return LearningReactiveProcessDefault(model: processModel, activities: activities, nextProcess: nextProcess)
    }
}
// MARK: public access
extension LearningReactiveProcessDefault {
    func addNext(process: Process){
        nextProcess.append {
            process
        }
    }
}

extension LearningReactiveProcessDefault: LearningReactiveProcess {
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process?) {
        DispatchQueue(label: self.queueName).async { [weak self] in
            guard let self = self else { return }
            var input = signal
            self.activities.forEach {
                if let activity = $0() {
                    input = activity.exec(signal: input, fromLayer: fromLayer, fromProcess: self)
                }
            }
            self.nextProcess.forEach {
                if let process = $0() {
                    process.exec(signal: input, fromLayer: fromLayer, fromProcess: self)
                }
            }
        }
    }
}
// MARK: - needed implementations
struct LearningReactiveProcessModelDefault: ProcessModel {
    
}
