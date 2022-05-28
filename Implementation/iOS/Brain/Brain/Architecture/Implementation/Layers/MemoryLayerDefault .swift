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
    
    init(context: BrainContext) {
        self.context = context
    }
}
// MARK: - MemoryLayer
extension MemoryLayerDefault: MemoryLayer {
    func signal(_ signal: Signal, fromLayer: Layer, fromProcess: Process) {
//        TODO
    }
    
}

