//  ProblemSolvingReasoningReactiveActivityDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of ProblemSolvingReasoningReactiveActivity

// MARK: - ProblemSolvingReasoningReactiveActivityDefault
class ProblemSolvingReasoningReactiveActivityDefault {
    var activityModels: [ActivityModel]

    init(activityModels: [ActivityModel]) {
        self.activityModels = activityModels
    }
}

extension ProblemSolvingReasoningReactiveActivityDefault: ProblemSolvingReasoningReactiveActivity {
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process) -> Signal? {
//        TODO
        return nil
    }
}
// MARK: - build
extension ProblemSolvingReasoningReactiveActivityDefault {
    static func build() -> ProblemSolvingReasoningReactiveActivityDefault {
        let model = ProblemSolvingReasoningReactiveModelDefault()
        return ProblemSolvingReasoningReactiveActivityDefault(activityModels: [model])
    }
}

// MARK: - models
class ProblemSolvingReasoningReactiveModelDefault: ProblemSolvingReasoningReactiveModel {
    
}
