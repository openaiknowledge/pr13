//  MemoryLayerDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of MemoryLayer
class MemoryLayerDefault {
    let context: BrainContext
    var processes = [Process]()
    var activities = [Activity]()

    let knowledgeLayer: KnowledgeLayer
    
    init(context: BrainContext,
         knowledgeLayer: KnowledgeLayer) {
        self.context = context
        self.knowledgeLayer = knowledgeLayer
    }
}
// MARK: - MemoryLayer
extension MemoryLayerDefault: MemoryLayer {
    func signal(_ signal: Signal) {
//        TODO
    }
    
}

