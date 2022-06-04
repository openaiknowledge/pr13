//  DeductiveReasoningReactiveActivityDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of DeductiveReasoningReactiveActivity

// MARK: - DeductiveReasoningReactiveActivityDefault
class DeductiveReasoningReactiveActivityDefault {
    var activityModels: [ActivityModel]

    init(activityModels: [ActivityModel]) {
        self.activityModels = activityModels
    }
}
extension DeductiveReasoningReactiveActivityDefault: DeductiveReasoningReactiveActivity {
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process) -> Signal? {
//        TODO
        return nil
    }
}
// MARK: - build
extension DeductiveReasoningReactiveActivityDefault {
    static func build() -> DeductiveReasoningReactiveActivityDefault {
        let model = DeductiveReasoningReactiveModelDefault()
        return DeductiveReasoningReactiveActivityDefault(activityModels: [model])
    }
}
// MARK: - models
class DeductiveReasoningReactiveModelDefault: DeductiveReasoningReactiveModel {
    
}
