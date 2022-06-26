//  FilterActionActivityDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of FilterActionActivity
import Foundation

// MARK: - FilterActionActivityDefault
class FilterActionActivityDefault {
    var activityModels: [ActivityModel]

    init(activityModels: [ActivityModel]) {
        self.activityModels = activityModels
    }
}
extension FilterActionActivityDefault: FilterActionActivity {
    func exec(event: Event, fromLayer: Layer, fromProcess: Process) -> Event? {
//        TODO
        return event
        /*
        if let brainData = BrainDataDefault.build(with: "FilterActionActivityDefault: I don´t know") {
            return EventDefault(data: brainData, date: Date())
        } else {
            return nil
        }
         */
    }

}
// MARK: - build
extension FilterActionActivityDefault {
    static func build() -> FilterActionActivityDefault {
        let model = FilterActionModelDefault()
        return FilterActionActivityDefault(activityModels: [model])
    }
}
// MARK: - models
class FilterActionModelDefault: FilterActionModel {
    
}
