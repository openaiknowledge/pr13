//  BrainArchitectureProtocols.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Base protocols for implementing Brain Architecture

// MARK: layers
protocol Brain {
    var perceptionLayer: PerceptionLayer { get }
    var actionLayer: ActionLayer { get }
    var reactiveLayer: ReactiveLayer { get }
    var proactiveLayer: ProactiveLayer { get }
    var learningLayer: LearningLayer { get }
    var memoryLayer: MemoryLayer { get }
    var knowledgeLayer: KnowledgeLayer { get }
    var context: BrainContext { get }
}

protocol Layer {
    var context: BrainContext { get }
}

protocol ActionLayer: Layer {
    var environment: Environment { get }
}

protocol ReactiveLayer: Layer {
   
}

protocol ProactiveLayer: Layer {
   
}
protocol LearningLayer: Layer {
   
}
protocol MemoryLayer: Layer {
   
}

protocol KnowledgeLayer: Layer {
   
}

// MARK: Context
protocol Context {
    
}

protocol BrainContext: Context {
    
}

// MARK: Models
protocol KModel {
    
}

// MARK: Controllers
protocol Controller {
    
}


// MARK: Event Generator
protocol EventGenerator {
    
}

// MARK: Process
protocol Process {

}
