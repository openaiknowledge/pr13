//  BrainArchitectureProtocols.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Base protocols for implementing Brain Architecture

// MARK: - brain
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

// MARK: - activity
protocol Activity {
    var activityModels: [ActivityModel] { get }

    // exec input and returns output using activityModels
    func exec(signal: Signal) -> Signal
}

// MARK: - Layers
protocol Layer {
    var context: BrainContext { get }
    var processes: [Process] { get } // processes to execute in the layer. Normally will be one
    var activities: [Activity] { get }  // activities to implement in the layer

    // functions
    func signal(_ signal: Signal)
}

protocol ActionLayer: Layer {
    var environment: Environment? { get }
}

protocol ReactiveLayer: Layer {
    // MARK: access to other Layers
    var memoryLayer: MemoryLayer { get }
    var actionLayer: ActionLayer { get }
}

protocol ProactiveLayer: Layer {
    // access to other Layers
    var memoryLayer: MemoryLayer { get }
    var actionLayer: ActionLayer { get }
}

protocol LearningLayer: Layer {
    // access to other Layers
    var knowledgeLayer: KnowledgeLayer { get }

}

protocol MemoryLayer: Layer {
    // access to other Layers
    var knowledgeLayer: KnowledgeLayer { get }

}

protocol KnowledgeLayer: Layer {
    // access to other Layers
    var proactiveLayer: ProactiveLayer! { get }
    var reactiveLayer: ReactiveLayer! { get }

}

// MARK: - Context
protocol Context {
    
}

protocol BrainContext: Context {
    
}

// MARK: - Models
protocol KModel {
    
}

protocol ProcessModel: KModel {
    
}

protocol ActivityModel: KModel {
    
}

protocol SymbolicModel: KModel {
    
}

protocol LogicModel: KModel {
    
}

// MARK: - Process
protocol Process {
    // where execute the process
    var queueName: String { get }
    
    // models used to model the process
    var model: ProcessModel { get } // model of the process
    
    // activities to exec (in order)
    var activities: [Activity] { get }
    
    // send info to next layers
    var nextLayers: [Layer] { get }
    
    // helpers
    var status: ProcessStatus { get }

    // execute activities in order
    func exec(signal: Signal)
}

protocol ProcessStatus {
    
}

// MARK: - general
protocol BrainData {
    
}

protocol Signal {
    var messages: [BrainData] { get }  // some levels of info of the signal
    var processStatus: [ProcessStatus] { get } // status of process executing in layer
}
