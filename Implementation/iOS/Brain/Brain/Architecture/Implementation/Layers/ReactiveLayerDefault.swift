//  ReactiveLayerDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of ReactiveLayer
class ReactiveLayerDefault {
    let context: BrainContext
    var processes = [Process]()
    var activities = [Activity]()

    let memoryLayer: MemoryLayer
    let actionLayer: ActionLayer
    
    init(context: BrainContext,
         memoryLayer: MemoryLayer,
         actionLayer: ActionLayer) {
        self.context = context
        self.memoryLayer = memoryLayer
        self.actionLayer = actionLayer
    }
}
// MARK: - ReactiveLayer
extension ReactiveLayerDefault: ReactiveLayer {
    func signal(_ signal: Signal) {
//        TODO
    }
    
}

