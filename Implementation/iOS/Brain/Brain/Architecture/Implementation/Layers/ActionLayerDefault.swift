//  ActionLayerDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of ActionLayer

import SwiftUI
class ActionLayerDefault {
    let context: BrainContext
    
    var processes: [Process]
    var activities: [Activity]

    weak var eventsDispatcher: EventsDispatcher?
    
    init(context: BrainContext,
         processes: [Process],
         activities: [Activity]) {
        self.context = context
        self.processes = processes
        self.activities = activities
    }
}
// MARK: - ActionLayer
extension ActionLayerDefault: ActionLayer {    

    func signal(_ signal: Signal, fromLayer: Layer, fromProcess: Process) {
        processes.forEach { process in
            process.exec(signal: signal, fromLayer: self, fromProcess: nil)
        }
    }
    
}
// MARK: - build
extension ActionLayerDefault {
    static func build(context: BrainContext) -> ActionLayerDefault {

        let mapperSignalToEventActivity = MapperSignalToEventActivityDefault.build()
        let representationOfEventActivity = RepresentationOfEventActivityDefault.build()
        let filterActionActivity = FilterActionActivityDefault.build()
        
        // It´s important the order
        let activities: [Activity] =
            [mapperSignalToEventActivity,
             representationOfEventActivity,
             filterActionActivity]
        
        return ActionLayerDefault(context: context,
                                   processes: [], activities: activities)
    }
    func setup(with eventsDispatcher: EventsDispatcher) {
        self.eventsDispatcher = eventsDispatcher
            
        let actionProcess = ActionProcessDefault.build(with: activities, eventsDispatcher: eventsDispatcher)
        
        processes.append(actionProcess)

    }
}
