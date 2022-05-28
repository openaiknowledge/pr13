//  InductiveReasoningReactiveActivityDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of InductiveReasoningReactiveActivity

// MARK: - InductiveReasoningReactiveActivityDefault
class InductiveReasoningReactiveActivityDefault {
    var activityModels: [ActivityModel]

    init(activityModels: [ActivityModel]) {
        self.activityModels = activityModels
    }
}
extension InductiveReasoningReactiveActivityDefault: InductiveReasoningReactiveActivity {
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process) -> Signal {
//        TODO
        return SignalDefault(messages: [], processStatus: [])
    }
}
// MARK: - build
extension InductiveReasoningReactiveActivityDefault {
    static func build() -> InductiveReasoningReactiveActivityDefault {
        let model = InductiveReasoningReactiveModelDefault()
        return InductiveReasoningReactiveActivityDefault(activityModels: [model])
    }
}
// MARK: - models
class InductiveReasoningReactiveModelDefault: InductiveReasoningReactiveModel {
    
}
