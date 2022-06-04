//  MapperSignalToEventActivityDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of MapperSignalToEventActivity

// MARK: - MapperSignalToEventActivityDefault
class MapperSignalToEventActivityDefault {
    var activityModels: [ActivityModel]

    init(activityModels: [ActivityModel]) {
        self.activityModels = activityModels
    }
}
extension MapperSignalToEventActivityDefault: MapperSignalToEventActivity {
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process) -> Event? {
//        TODO
        return nil
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
