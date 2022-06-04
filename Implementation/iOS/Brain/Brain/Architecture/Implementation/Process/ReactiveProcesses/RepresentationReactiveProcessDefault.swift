//  RepresentationReactiveProcessDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 21/05/2022
//
//  Default implementation of RepresentationReactive processes
//
import Foundation

// MARK: - RepresentationReactiveProcessDefault
// it takes representation and call to other process to execute with this representation
class RepresentationReactiveProcessDefault {
    var model: ProcessModel
    var status: ProcessStatus = ProcessStatusDefault.idle
    var activities: WeakArray<Activity>
    var nextLayers = WeakArray<Layer>() // empty
    var nextProcess: [Process]
    
    init(model: ProcessModel, activities: [Activity], nextProcess: [Process]) {
        self.model = model
        self.activities = activities.weak()
        self.nextProcess = nextProcess
    }
}

extension RepresentationReactiveProcessDefault {
    static func build(with activities: [Activity], nextProcess: [Process]) -> RepresentationReactiveProcessDefault {
        let processModel = RepresentationReactiveProcessModelDefault()

        return RepresentationReactiveProcessDefault(model: processModel, activities: activities, nextProcess: nextProcess)
    }
}
extension RepresentationReactiveProcessDefault:  RepresentationReactiveProcess {
    // execute activities in order
    // execute next process
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process?) {
        DispatchQueue(label: self.queueName).async { [weak self] in
            guard let self = self else { return }
            var input = signal
            self.activities.forEach {
                if let activity = $0() {
                    if let result = activity.exec(signal: input, fromLayer: fromLayer, fromProcess: self) {
                        input = result
                    }
                }
            }
            self.nextProcess.forEach {
                $0.exec(signal: input, fromLayer: fromLayer, fromProcess: self)
            }
        }
    }
}
// MARK: - needed implementations
struct RepresentationReactiveProcessModelDefault: ProcessModel {
    
}
