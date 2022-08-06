//  CausalProcessDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 21/05/2022
//
//  Default implementation of CausalProcess
//
import Foundation

// MARK: - CausalProcessDefault
class CausalProcessDefault {
    
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

extension CausalProcessDefault {
    static func build(with activities: [Activity], nextProcess: [Process]) -> CausalProcessDefault {
        let processModel = CausalProcessModelDefault()

        return CausalProcessDefault(model: processModel, activities: activities, nextProcess: nextProcess)
    }
}
// MARK: public access
extension CausalProcessDefault {
    func addNext(process: Process){
        nextProcess.append {
            process
        }
    }
}

extension CausalProcessDefault: CausalProcess {
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process?) {
        DispatchQueue(label: self.queueName).async { [weak self] in
            guard let self = self else { return }
            let input = signal
            var output: Signal?
            self.activities.forEach {
                if let activity = $0() {
                    if let inputResult = activity.exec(signal: input, fromLayer: fromLayer, fromProcess: self) {
                        var messages = inputResult.messages
                        var processStatus = inputResult.processStatus
                        if let oldMessages = output?.messages, let oldProcessStatus = output?.processStatus {
                            messages.append(contentsOf: oldMessages)
                            processStatus.append(contentsOf: oldProcessStatus)
                        }
                        output = SignalDefault(messages: messages, processStatus: processStatus)
                    }
                }
            }
            self.nextProcess.forEach {
                if let process = $0(), let output = output {
                    process.exec(signal: output, fromLayer: fromLayer, fromProcess: self)
                }
            }
        }
    }
}
// MARK: - needed implementations
struct CausalProcessModelDefault: ProcessModel {
    
}
