//  EnvironmentDefault.swift
//  Environment
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Default implementation of Environment and their default implementations

import UIKit

// MARK: - Environment
struct EnvironmentDefault: Environment {
    var sight: SightInputController    

    let context: EnvironmentContext
    let brain: Brain
    
}

// MARK: - EnvironmentContext
struct EnvironmentContextDefault: EnvironmentContext {

}

// MARK: - Event
class EventDefault: Event {
    var date: Date
    
    var messages = [BrainData]()
    
    var processStatus = [ProcessStatus]()

    init(date: Date) {
        self.date = date
    }
}

// MARK: - EventGenerator
class EventGeneratorDefault: EventGenerator {
    func generate() -> Event {
        return EventDefault(date: Date())
    }
}
