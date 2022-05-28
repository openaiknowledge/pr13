//  KnowledgeLayerDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of KnowledgeLayer
class KnowledgeLayerDefault {
    let context: BrainContext
    var processes = [Process]()
    var activities = [Activity]()
    
    // access to other Layers to input
    let learningLayer: LearningLayer
    let memoryLayer: MemoryLayer
    
    init(context: BrainContext,
         learningLayer: LearningLayer,
         memoryLayer: MemoryLayer) {
        self.context = context
        self.learningLayer = learningLayer
        self.memoryLayer = memoryLayer
    }
}
// MARK: - KnowledgeLayer
extension KnowledgeLayerDefault: KnowledgeLayer {

    func signal(_ signal: Signal, fromLayer: Layer, fromProcess: Process) {
//        TODO
    }
    
}

