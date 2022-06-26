//  EnvironmentDefault.swift
//  Environment
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Default implementation of Environment and their default implementations

import UIKit

// MARK: - Environment
class EnvironmentDefault {
    let context: EnvironmentContext
    let eventsDispatcher: EventsDispatcher
    
    let sightInputController: SightInputController
    let imageOutputController: ImageOutputController

    unowned var perceptionLayer: PerceptionLayer

    init(context: EnvironmentContext,
         eventsDispatcher: EventsDispatcher,
         sightInputController: SightInputController,
         imageOutputController: ImageOutputController,
         perceptionLayer: PerceptionLayer) {

        self.context = context
        self.eventsDispatcher = eventsDispatcher
        self.sightInputController = sightInputController
        self.imageOutputController = imageOutputController
        self.perceptionLayer = perceptionLayer
    }
}
// MARK: - Environment
extension EnvironmentDefault: Environment {
    
}
// MARK: - EnvironmentContext
struct EnvironmentContextDefault: EnvironmentContext {

}

// MARK: - Event
struct EventDefault: Event {
    let date: Date
    let signal: Signal

    init(signal: Signal) {
        self.signal = signal
        self.date = Date()
    }

    init(data: BrainData, date: Date) {
        self.signal = SignalDefault(messages: [data], processStatus: [])
        self.date = date
    }
}

// MARK: - EventGenerator
class EventGeneratorDefault: EventGenerator {

    func generate(data: BrainData) -> Event {
        return EventDefault(data: data, date: Date())
    }
}

// MARK: - EventGenerator
class EventsDispatcherDefault: EventsDispatcher {
    var systems: WeakArray<SystemOutputController>
    
    init(outputSystems: [SystemOutputController]) {
        self.systems = outputSystems.weak()
    }
    
    func dispatch(events: [Event]) {
        // TODO
        events.forEach { event in
            systems.forEach {
                if let system = $0() {
                    if let data = event.signal.messages.first {
                        system.output(data: data)
                    }
                }
            }
        }
    }
}
