//  ProactiveLayerDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// TODO
struct ProactiveLayerDefault: ProactiveLayer {
    
    let context: BrainContext
    var process = [Process]()
    var activity = [Activity]()

    let memoryLayer: MemoryLayer    
    let actionLayer: ActionLayer
    
}
