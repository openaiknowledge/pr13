//  PerceptionProcess.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Default implementation of Perception process
class PerceptionProcessDefault {
    let model: ProcessModel
    let status: ProcessStatus = ProcessStatusDefault.idle
        
    let activities: WeakArray<Activity>
    let nextLayers: WeakArray<Layer>
    
    init(model: ProcessModel, activities: [Activity], nextLayers: [Layer]) {
        self.model = model

        self.activities = activities.weak()
        self.nextLayers = nextLayers.weak()
    }
    
}
// MARK: - Process
extension PerceptionProcessDefault: Process {
    
}

// MARK: - build
extension PerceptionProcessDefault {
    
    static func build(with activities: [Activity], nextLayers: [Layer]) -> PerceptionProcessDefault {
        let processModel = PerceptionProcessModelDefault()

        return PerceptionProcessDefault(model: processModel, activities: activities, nextLayers: nextLayers)
    }
}

// MARK: - needed implementations
struct PerceptionProcessModelDefault: ProcessModel {
    
}
