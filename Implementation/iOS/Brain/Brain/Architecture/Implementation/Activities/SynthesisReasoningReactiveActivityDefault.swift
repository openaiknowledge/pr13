//  SynthesisReasoningReactiveActivityDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of SynthesisReasoningReactiveActivity

// MARK: - SynthesisReasoningReactiveActivityDefault
class SynthesisReasoningReactiveActivityDefault {
    var activityModels: [ActivityModel]

    init(activityModels: [ActivityModel]) {
        self.activityModels = activityModels
    }
}

extension SynthesisReasoningReactiveActivityDefault: SynthesisReasoningReactiveActivity {
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process) -> Signal? {
//        TODO
        return nil
    }
}
// MARK: - build
extension SynthesisReasoningReactiveActivityDefault {
    static func build() -> SynthesisReasoningReactiveActivityDefault {
        let model = SynthesisReasoningReactiveModelDefault()
        return SynthesisReasoningReactiveActivityDefault(activityModels: [model])
    }
}
// MARK: - models
class SynthesisReasoningReactiveModelDefault: SynthesisReasoningReactiveModel {
    
}
