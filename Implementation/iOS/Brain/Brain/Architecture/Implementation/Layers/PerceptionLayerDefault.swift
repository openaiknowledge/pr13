//  PerceptionLayerDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of PerceptionLayer
class PerceptionLayerDefault  {
    let context: BrainContext
    var processes = [Process]()
    var activities = [Activity]()

    let reactiveLayer: ReactiveLayer
    let memoryLayer: MemoryLayer
    
    init(context: BrainContext,
         reactiveLayer: ReactiveLayer,
         memoryLayer: MemoryLayer) {
        self.context = context
        self.reactiveLayer = reactiveLayer
        self.memoryLayer = memoryLayer
    }
}
// MARK: - PerceptionLayer
extension PerceptionLayerDefault: PerceptionLayer {
    // functions
    func signal(_ signal: Signal) {
        // this layer will not receive signals, only events
    }
    
    func event(_ event: Event) {
        let perceptionProcessModel = PerceptionProcessModelDefault()
        let activities: [Activity] = [] // TODO
        let nextLayers: [Layer] = [] // TODO
        let process = PerceptionProcessDefault(model: perceptionProcessModel, activities: activities, nextLayers: nextLayers)
        processes.append(process)
        process.exec(signal: event.signal)
        
    }
}
