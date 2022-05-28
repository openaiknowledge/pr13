//  ProactiveLayerDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of ProactiveLayer
class ProactiveLayerDefault {
    let context: BrainContext
    var processes = [Process]()
    var activities = [Activity]()

    let memoryLayer: MemoryLayer
    let actionLayer: ActionLayer
    let knowledgeLayer: KnowledgeLayer
    
    init(context: BrainContext,
         memoryLayer: MemoryLayer,
         actionLayer: ActionLayer,
         knowledgeLayer: KnowledgeLayer) {
        self.context = context
        self.memoryLayer = memoryLayer
        self.actionLayer = actionLayer
        self.knowledgeLayer = knowledgeLayer
    }
}
// MARK: - ProactiveLayer
extension ProactiveLayerDefault: ProactiveLayer {
    func signal(_ signal: Signal, fromLayer: Layer, fromProcess: Process) {
//        TODO
    }
    
}

