//  LearningLayerDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of LearningLayer
class LearningLayerDefault {
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
// MARK: - LearningLayer
extension LearningLayerDefault: LearningLayer {
    func signal(_ signal: Signal) {
//        TODO
    }
    
}
