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

    // to inject -> must be injected. Must exist
    var proactiveLayer: ProactiveLayer!
    var reactiveLayer: ReactiveLayer!
    
    init(context: BrainContext) {
        self.context = context
    }
}
// MARK: - KnowledgeLayer
extension KnowledgeLayerDefault: KnowledgeLayer {

    func signal(_ signal: Signal) {
//        TODO
    }
    
}

