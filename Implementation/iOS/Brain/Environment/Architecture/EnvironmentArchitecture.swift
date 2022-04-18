//  EnvironmentArchitecture.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Base protocols for implementing Environment Architecture

import Foundation  // TimeInterval

// MARK: Environment
protocol Environment {
    var context: EnvironmentContext { get }
    var brain: Brain { get }

    var perceptionLayer: PerceptionLayer { get }
}

// MARK: general extension
extension Environment {
    var perceptionLayer: PerceptionLayer {
        return brain.perceptionLayer
    }
}

// MARK: - EnvironmentContext
protocol EnvironmentContext: Context {
    
}

// MARK: - Event
protocol Event {
    var data: [BrainData] { get } // normally will be 1 element
    var environmentContext: EnvironmentContext { get }
    var time: TimeInterval { get }
}

protocol EventGenerator {
    func generate(event: Event)
}

