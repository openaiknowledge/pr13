//  FilterActionActivityDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of FilterActionActivity

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
        return nil
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
