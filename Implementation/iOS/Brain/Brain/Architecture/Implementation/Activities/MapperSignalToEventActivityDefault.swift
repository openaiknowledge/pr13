//  MapperSignalToEventActivityDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of MapperSignalToEventActivity
import Foundation
import Logging

// MARK: - MapperSignalToEventActivityDefault
class MapperSignalToEventActivityDefault {
    var activityModels: [ActivityModel]

    init(activityModels: [ActivityModel]) {
        self.activityModels = activityModels
    }
}
extension MapperSignalToEventActivityDefault: MapperSignalToEventActivity {
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process) -> Event? {
        return EventDefault(signal: signal)
    }
}
// MARK: - build
extension MapperSignalToEventActivityDefault {
    static func build() -> MapperSignalToEventActivityDefault {
        let model = MapperSignalToEventModelDefault()
        return MapperSignalToEventActivityDefault(activityModels: [model])
    }
}
// MARK: - models
class MapperSignalToEventModelDefault: MapperSignalToEventModel {
    
}
