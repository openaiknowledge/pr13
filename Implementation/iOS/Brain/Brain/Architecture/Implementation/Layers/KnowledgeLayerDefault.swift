//  KnowledgeLayerDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// TODO
struct KnowledgeLayerDefault: KnowledgeLayer {
    let context: BrainContext
    var process = [Process]()
    var activity = [Activity]()
    
    let proactiveLayer: ProactiveLayer    
    let reactiveLayer: ReactiveLayer

}
