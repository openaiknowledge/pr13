//  PerceptionProcess.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Default implementation of Perception process
class PerceptionProcessDefault {
    let model: ProcessModel
    let activities: [Activity]
    
//   TODO: implement weak arrays
    // weak array -> typealias WeakArray<T> = [() -> T?] https://frouo.com/posts/swift-how-to-declare-an-array-of-weak-references
    let nextLayers: [Layer]
    
    let status: ProcessStatus = ProcessStatusDefault.idle
        
    init(model: ProcessModel, activities: [Activity], nextLayers: [Layer]) {
        self.model = model
        self.activities = activities
        self.nextLayers = nextLayers
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
