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
    
    init(context: BrainContext) {
        self.context = context
    }
}
// MARK: - LearningLayer
extension LearningLayerDefault: LearningLayer {
    func signal(_ signal: Signal, fromLayer: Layer, fromProcess: Process) {
        print("LearningLayerDefault - signal: \(signal)")

    }
    
}
