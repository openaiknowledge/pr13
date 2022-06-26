//  PerceptionLayerDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of PerceptionLayer
import Logging

class PerceptionLayerDefault  {
    //
    let context: BrainContext

    //
    var processes: [Process]
    var activities: [Activity]
    
    let reactiveLayer: ReactiveLayer
    let learningLayer: LearningLayer
    
    init(context: BrainContext,
         processes: [Process],
         activities: [Activity],
         reactiveLayer: ReactiveLayer,
         learningLayer: LearningLayer) {
        self.context = context
        self.activities = activities
        self.processes = processes
        self.reactiveLayer = reactiveLayer
        self.learningLayer = learningLayer
        
    }
}
// MARK: - build
extension PerceptionLayerDefault {
    static func build(with context: BrainContext,
                      reactiveLayer: ReactiveLayer,
                      learningLayer: LearningLayer) -> PerceptionLayerDefault {
        let mapperEventToSignalActivity = MapperEventToSignalActivityDefault.build()
        let RepresentationOfSignaltActivity = RepresentationOfSignaltActivityDefault.build()
        let filterPerceptionActivity = FilterPerceptionActivityDefault.build()

        let activities: [Activity] = [mapperEventToSignalActivity,
                                      RepresentationOfSignaltActivity,
                                      filterPerceptionActivity]
        
        let nextLayers = [reactiveLayer, learningLayer]
        let perceptionProcess = PerceptionProcessDefault.build(with: activities, nextLayers: nextLayers)
        return PerceptionLayerDefault(context: context, processes: [perceptionProcess], activities: activities, reactiveLayer: reactiveLayer, learningLayer: learningLayer)
    }
}

// MARK: - PerceptionLayer
extension PerceptionLayerDefault: PerceptionLayer {

    // functions
    func signal(_ signal: Signal, fromLayer: Layer, fromProcess: Process) {
        // this layer will not receive signals, only events
    }
    
    func event(_ event: Event) {
        Logger(label: String(describing: self)).info("Event: \(event)")

        processes.forEach { process in
            process.exec(signal: event.signal, fromLayer: self, fromProcess: nil)
        }
    }
}
// MARK: - activies
// MARK: - MapperEventToSignalActivityDefault
class MapperEventToSignalActivityDefault {
    var activityModels: [ActivityModel]

    init(activityModels: [ActivityModel]) {
        self.activityModels = activityModels
    }
    
}
// MARK: - MapperEventToSignalActivity
extension MapperEventToSignalActivityDefault: MapperEventToSignalActivity {
    
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process) -> Signal? {
//        TODO
        var messages = signal.messages
        let encoding = BrainDataDefault.Constants.txtEncodingDefault
        guard let data = "MapperEventToSignalActivityDefault".data(using: encoding) else {
            return signal
        }
        let brainData = BrainDataDefault(type: .text, encoding: .txt(encoding), data:  data)
        
        messages.append(brainData)
        let processStatus = ProcessStatusDefault.running
        return SignalDefault(messages: messages, processStatus: [processStatus])
    }
}
// MARK: - build
extension MapperEventToSignalActivityDefault {
    static func build() -> MapperEventToSignalActivityDefault {
        let model = MapperEventToSignalModelDefault()
        return MapperEventToSignalActivityDefault(activityModels: [model])
    }
}
            
// MARK: - RepresentationOfSignaltActivityDefault
class RepresentationOfSignaltActivityDefault {
    var activityModels: [ActivityModel]
    
    init(activityModels: [ActivityModel]) {
        self.activityModels = activityModels
    }
    
}
// MARK: - RepresentationOfSignaltActivity
extension RepresentationOfSignaltActivityDefault: RepresentationOfSignaltActivity {
    
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process) -> Signal? {
//        TODO
        var messages = signal.messages
        let encoding = BrainDataDefault.Constants.txtEncodingDefault
        guard let data = "RepresentationOfSignaltActivityDefault".data(using: encoding) else {
            return signal
        }
        let brainData = BrainDataDefault(type: .text, encoding: .txt(encoding), data:  data)
        
        messages.append(brainData)
        let processStatus = ProcessStatusDefault.running
        return SignalDefault(messages: messages, processStatus: [processStatus])
    }
}
// MARK: - build
extension RepresentationOfSignaltActivityDefault {
    static func build() -> RepresentationOfSignaltActivityDefault {
        let model = RepresentationOfSignaltModelDefault()
        return RepresentationOfSignaltActivityDefault(activityModels: [model])
    }
}
// MARK: - FilterPerceptionActivityDefault
class FilterPerceptionActivityDefault {
    var activityModels: [ActivityModel]
    
    init(activityModels: [ActivityModel]) {
        self.activityModels = activityModels
    }

}
// MARK: - FilterPerceptionActivity
extension FilterPerceptionActivityDefault: FilterPerceptionActivity {

    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process) -> Signal? {
//        TODO
        var messages = signal.messages
        let encoding = BrainDataDefault.Constants.txtEncodingDefault
        guard let data = "FilterPerceptionActivityDefault".data(using: encoding) else {
            return signal
        }
        let brainData = BrainDataDefault(type: .text, encoding: .txt(encoding), data:  data)
        
        messages.append(brainData)
        let processStatus = ProcessStatusDefault.running
        return SignalDefault(messages: messages, processStatus: [processStatus])
        
    }
}
// MARK: - build
extension FilterPerceptionActivityDefault {
    static func build() -> FilterPerceptionActivityDefault {
        let model = FilterPerceptionModelDefault()
        return FilterPerceptionActivityDefault(activityModels: [model])
    }
}
// MARK: - models
class MapperEventToSignalModelDefault: MapperEventToSignalModel {
    //    TODO
}

class RepresentationOfSignaltModelDefault: RepresentationOfSignaltModel {
    //    TODO
}

class FilterPerceptionModelDefault: FilterPerceptionModel {
    //    TODO
}
