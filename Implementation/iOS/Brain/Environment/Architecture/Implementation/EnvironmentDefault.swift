//  EnvironmentDefault.swift
//  Environment
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Default implementation of Environment and their default implementations

import UIKit

// MARK: - Environment
class EnvironmentDefault: Environment {
    var sight: SightInputController    

    let context: EnvironmentContext
    unowned var perceptionLayer: PerceptionLayer

    init(sight: SightInputController,
         context: EnvironmentContext,
         perceptionLayer: PerceptionLayer) {
        self.sight = sight
        self.context = context
        self.perceptionLayer = perceptionLayer
    }
}

// MARK: - EnvironmentContext
struct EnvironmentContextDefault: EnvironmentContext {

}

// MARK: - Event
struct EventDefault: Event {
    let date: Date
    let signal: Signal

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
