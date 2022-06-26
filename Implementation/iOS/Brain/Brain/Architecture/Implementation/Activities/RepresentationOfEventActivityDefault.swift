//  RepresentationOfEventActivityDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of RepresentationOfEventActivity
import Foundation
// MARK: - RepresentationOfEventActivityDefault
class RepresentationOfEventActivityDefault {
    var activityModels: [ActivityModel]

    init(activityModels: [ActivityModel]) {
        self.activityModels = activityModels
    }
}
extension RepresentationOfEventActivityDefault: RepresentationOfEventActivity {
    func exec(event: Event, fromLayer: Layer, fromProcess: Process) -> Event? {
        //TODO
        return event
    }
}
// MARK: - build
extension RepresentationOfEventActivityDefault {
    static func build() -> RepresentationOfEventActivityDefault {
        let model = RepresentationOfEventModelDefault()
        return RepresentationOfEventActivityDefault(activityModels: [model])
    }
}
// MARK: - models
class RepresentationOfEventModelDefault: RepresentationOfEventModel {
    
}
