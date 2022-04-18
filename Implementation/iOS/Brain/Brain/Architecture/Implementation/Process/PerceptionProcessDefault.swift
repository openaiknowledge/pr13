//  PerceptionProcess.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Default implementation of Perception process
class PerceptionProcessDefault {
        
    let model: ProcessModel
    
    let activities: [Activity]

    let nextLayers: [Layer]
    
    let status: ProcessStatus = ProcessStatusDefault.idle
        
    init(model: ProcessModel, activities: [Activity], nextLayers: [Layer]) {
        self.model = model
        self.activities = activities
        self.nextLayers = nextLayers
    }
    
}
// MARK: - public functions
extension PerceptionProcessDefault: Process {

}
// MARK: - needed implementations
struct PerceptionProcessModelDefault: ProcessModel {
    
}

// TODO
class MapperEventToSignalActivityDefault: MapperEventToSignalActivity {
    var activityModels = [ActivityModel]()
    
    func exec(signal: Signal) -> Signal {
        return SignalDefault(messages: [], processStatus: [])
    }
}
// TODO
class RepresentationOfSignalWithContextActivityDefault: RepresentationOfSignalWithContextActivity {
    var activityModels = [ActivityModel]()
    
    func exec(signal: Signal) -> Signal {
        return SignalDefault(messages: [], processStatus: [])
    }
}
// TODO
class FilterPerceptionActivityDefault: FilterPerceptionActivity {
    var activityModels = [ActivityModel]()
    
    func exec(signal: Signal) -> Signal {
        return SignalDefault(messages: [], processStatus: [])
    }
}


// MARK: - build
extension PerceptionProcessDefault {
    // TODO
    static func build(with layer: PerceptionLayer) -> PerceptionProcessDefault {
        let processModel = PerceptionProcessModelDefault()
        
        let activities: [Activity] = [MapperEventToSignalActivityDefault(),
                          MapperEventToSignalActivityDefault(),
                          FilterPerceptionActivityDefault()]
        
        let layers = [layer.reactiveLayer, layer.memoryLayer]
        
        return PerceptionProcessDefault(model: processModel, activities: activities, nextLayers: layers)
    }
}
