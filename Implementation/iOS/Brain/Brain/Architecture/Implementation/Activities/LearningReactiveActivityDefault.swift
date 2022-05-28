//  LearningReactiveActivityDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of LearningReactiveActivity

// MARK: - LearningReactiveActivityDefault
class LearningReactiveActivityDefault {
    var activityModels: [ActivityModel]

    init(activityModels: [ActivityModel]) {
        self.activityModels = activityModels
    }
}

extension LearningReactiveActivityDefault: LearningReactiveActivity {
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process) -> Signal {
//        TODO
        return SignalDefault(messages: [], processStatus: [])
    }
}
// MARK: - build
extension LearningReactiveActivityDefault {
    static func build() -> LearningReactiveActivityDefault {
        let model = LearningReactiveModelDefault()
        return LearningReactiveActivityDefault(activityModels: [model])
    }
}
// MARK: - models
class LearningReactiveModelDefault: LearningReactiveModel {
    
}
