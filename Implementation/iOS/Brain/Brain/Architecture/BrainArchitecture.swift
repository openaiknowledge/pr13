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
protocol Activity: AnyObject {
    var activityModels: [ActivityModel] { get }

    // exec input and returns output using activityModels
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process) -> Signal?
}

// MARK: - Layers
protocol Layer: AnyObject {
    var context: BrainContext { get }
    var processes: [Process] { get } // processes to execute in the layer. Normally will be one
    var activities: [Activity] { get }  // activities to implement in the layer

    // functions
    func signal(_ signal: Signal, fromLayer: Layer, fromProcess: Process)
}

protocol ProactiveLayer: Layer {
    // access to other Layers: output
    var actionLayer: ActionLayer { get }
    // access to other Layers: output/input
    var memoryLayer: MemoryLayer { get }
    
    // access to other Layers to input
    var knowledgeLayer: KnowledgeLayer { get }
}

protocol LearningLayer: Layer {

}

protocol MemoryLayer: Layer {


}

protocol KnowledgeLayer: Layer {
    // access to other Layers to input
    var learningLayer: LearningLayer { get }
    var memoryLayer: MemoryLayer { get }
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

protocol ModelProviding {
    var model: KModel? { get }
}

// Embedding represents relatively low-dimensional space into which you can translate high-dimensional vectors
// TODO
protocol EmbeddingModel: KModel {
    
}

// MARK: - Process
// We need Process to be AnyObject to implement default exec using weak
protocol Process: AnyObject {
    // where execute the process
    var queueName: String { get }
    
    // models used to model the process
    var model: ProcessModel { get } // model of the process
        
    // helpers
    var status: ProcessStatus { get }

    
    // activities to exec (in order)
    var activities: WeakArray<Activity> { get }
    // send info to next layers
    var nextLayers: WeakArray<Layer> { get }
    
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process?)
}

protocol ProcessStatus {
    
}

// MARK: - general
// BrainData represents data used in Brain
protocol BrainData {
    
}
// Signal represents signal passed between layers in brain
protocol Signal {
    var messages: [BrainData] { get }  // some levels of info of the signal
    var processStatus: [ProcessStatus] { get } // status of process executing in layer
}
