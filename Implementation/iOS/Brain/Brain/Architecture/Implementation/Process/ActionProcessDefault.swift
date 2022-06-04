//  ActionProcess.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Default implementation of Action process
import Foundation

class ActionProcessDefault {
    let model: ProcessModel
    let status: ProcessStatus = ProcessStatusDefault.idle
        
    let activities: WeakArray<Activity>
    let nextLayers = WeakArray<Layer>()
    let eventsDispatcher: EventsDispatcher
    
    init(model: ProcessModel,
         activities: [Activity],
         eventsDispatcher: EventsDispatcher) {
        
        self.model = model
        self.activities = activities.weak()
        self.eventsDispatcher = eventsDispatcher
    }
    
}
// MARK: - build
extension ActionProcessDefault {
    
    static func build(with activities: [Activity],
                      eventsDispatcher: EventsDispatcher) -> ActionProcessDefault {
        
        let processModel = ActionProcessModelDefault()

        return ActionProcessDefault(model: processModel, activities: activities, eventsDispatcher: eventsDispatcher)
    }
}
// MARK: - Process
extension ActionProcessDefault:  ActionProcess {
    // execute activities in order
    // execute next process
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process?) {
        DispatchQueue(label: self.queueName).async { [weak self] in
            guard let self = self else { return }
            var event: Event?
            self.activities.forEach {
                    switch $0() {
                    case let activity as MapperSignalToEventActivity:
                        event = activity.exec(signal: signal, fromLayer: fromLayer, fromProcess: self)
                    case let activity as RepresentationOfEventActivity:
                        if let eventAux = event {
                            event = activity.exec(event: eventAux, fromLayer: fromLayer, fromProcess: self)
                        }
                    case let activity as FilterActionActivity:
                        if let eventAux = event {
                            event = activity.exec(event: eventAux, fromLayer: fromLayer, fromProcess: self)
                        }
                    default: break
                    }
            }
            if let event = event {
                self.eventsDispatcher.dispatch(events: [event])
            }
        }
    }
}
// MARK: - needed implementations
struct ActionProcessModelDefault: ProcessModel {
    
}
