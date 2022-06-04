//  CausalReasoningReactiveActivityDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of CausalReasoningReactiveActivity

// MARK: - CausalReasoningReactiveActivityDefault
class CausalReasoningReactiveActivityDefault {
    var activityModels: [ActivityModel]

    init(activityModels: [ActivityModel]) {
        self.activityModels = activityModels
    }
}
extension CausalReasoningReactiveActivityDefault: CausalReasoningReactiveActivity {
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process) -> Signal? {
//        TODO
        return nil

    }
}
// MARK: - build
extension CausalReasoningReactiveActivityDefault {
    static func build() -> CausalReasoningReactiveActivityDefault {
        let model = CausalReasoningReactiveModelDefault()
        return CausalReasoningReactiveActivityDefault(activityModels: [model])
    }
}
// MARK: - models
class CausalReasoningReactiveModelDefault: CausalReasoningReactiveModel {
    
}
