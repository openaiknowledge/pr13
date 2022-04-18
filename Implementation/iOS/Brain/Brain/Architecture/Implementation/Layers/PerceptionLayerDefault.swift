//  PerceptionLayerDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// TODO
struct PerceptionLayerDefault: PerceptionLayer {
    let context: BrainContext
    var process = [Process]()
    var activity = [Activity]()

    let reactiveLayer: ReactiveLayer
    let memoryLayer: MemoryLayer
 
}
