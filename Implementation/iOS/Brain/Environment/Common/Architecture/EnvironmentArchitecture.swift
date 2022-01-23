//  BrainArchitectureProtocols.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Base protocols for implementing Environment Architecture

// MARK: Environment
protocol Environment {
    var context: EnvironmentContext { get }
    var brain: Brain { get }
    var outerBrain: OuterBrain { get }
     
    var perceptionLayer: PerceptionLayer { get }
}

// MARK: - general extension
extension Environment {
    var perceptionLayer: PerceptionLayer {
        return brain.perceptionLayer
    }
}

// MARK: - EnvironmentContext
protocol EnvironmentContext: Context {
    
}
