//  ActionLayerDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of ActionLayer
class ActionLayerDefault {
    let context: BrainContext
    var processes = [Process]()
    var activities = [Activity]()

    weak var environment: Environment?
    
    init(context: BrainContext) {
        self.context = context
    }
}
// MARK: - ActionLayer
extension ActionLayerDefault: ActionLayer {
    func signal(_ signal: Signal) {
//        TODO
    }
    
}

