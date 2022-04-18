//  MemoryLayerDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// TODO
struct MemoryLayerDefault: MemoryLayer {
    let context: BrainContext
    var process = [Process]()
    var activity = [Activity]()

    let knowledgeLayer: KnowledgeLayer

}
