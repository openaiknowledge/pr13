//  RepresentationOfPerceptionSignalActivityDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of RepresentationOfPerceptionSignalActivity

// MARK: - RepresentationOfPerceptionSignalActivityDefault
class RepresentationOfPerceptionSignalActivityDefault {
    var activityModels: [ActivityModel]

    init(activityModels: [ActivityModel]) {
        self.activityModels = activityModels
    }
}
extension RepresentationOfPerceptionSignalActivityDefault: RepresentationOfPerceptionSignalActivity {
    
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process) -> Signal {
//        TODO
        return SignalDefault(messages: [], processStatus: [])
    }
}
// MARK: - build
extension RepresentationOfPerceptionSignalActivityDefault {
    static func build() -> RepresentationOfPerceptionSignalActivityDefault {
        let model = RepresentationOfPerceptionSignalModelDefault()
        return RepresentationOfPerceptionSignalActivityDefault(activityModels: [model])
    }
}
// MARK: - models
class RepresentationOfPerceptionSignalModelDefault: RepresentationOfPerceptionSignalModel {
    
}
