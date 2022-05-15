//  PerceptionLayerDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of PerceptionLayer
class PerceptionLayerDefault  {
    //
    var processes: [Process]
    var activities: [Activity]

    //
    let context: BrainContext
    
    // next layers
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
        let representationOfSignalWithContextActivity = RepresentationOfSignalWithContextActivityDefault.build()
        let filterPerceptionActivity = FilterPerceptionActivityDefault.build()

        let activities: [Activity] = [mapperEventToSignalActivity,
                                      representationOfSignalWithContextActivity,
                                      filterPerceptionActivity]
        
        let nextLayers = [reactiveLayer, learningLayer]
        let perceptionProcess = PerceptionProcessDefault.build(with: activities, nextLayers: nextLayers)
        return PerceptionLayerDefault(context: context, processes: [perceptionProcess], activities: activities, reactiveLayer: reactiveLayer, learningLayer: learningLayer)
    }
}

// MARK: - PerceptionLayer
extension PerceptionLayerDefault: PerceptionLayer {
    // functions
    func signal(_ signal: Signal) {
        // this layer will not receive signals, only events
    }
    
    func event(_ event: Event) {
        print("PerceptionLayerDefault - event: \(event)")
        processes.forEach { process in
            process.exec(signal: event.signal)
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
    
    func exec(signal: Signal) -> Signal {
//        TODO
        var messages = signal.messages
        let encoding = BrainDataDefault.Constant.txtEncodingDefault
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
            
// MARK: - RepresentationOfSignalWithContextActivityDefault
class RepresentationOfSignalWithContextActivityDefault {
    var activityModels: [ActivityModel]
    
    init(activityModels: [ActivityModel]) {
        self.activityModels = activityModels
    }
    
}
// MARK: - RepresentationOfSignalWithContextActivity
extension RepresentationOfSignalWithContextActivityDefault: RepresentationOfSignalWithContextActivity {
    
    func exec(signal: Signal) -> Signal {
//        TODO
        var messages = signal.messages
        let encoding = BrainDataDefault.Constant.txtEncodingDefault
        guard let data = "RepresentationOfSignalWithContextActivityDefault".data(using: encoding) else {
            return signal
        }
        let brainData = BrainDataDefault(type: .text, encoding: .txt(encoding), data:  data)
        
        messages.append(brainData)
        let processStatus = ProcessStatusDefault.running
        return SignalDefault(messages: messages, processStatus: [processStatus])
    }
}
// MARK: - build
extension RepresentationOfSignalWithContextActivityDefault {
    static func build() -> RepresentationOfSignalWithContextActivityDefault {
        let model = RepresentationOfSignalWithContextModelDefault()
        return RepresentationOfSignalWithContextActivityDefault(activityModels: [model])
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

    func exec(signal: Signal) -> Signal {
//        TODO
        var messages = signal.messages
        let encoding = BrainDataDefault.Constant.txtEncodingDefault
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

class RepresentationOfSignalWithContextModelDefault: RepresentationOfSignalWithContextModel {
    //    TODO
}

class FilterPerceptionModelDefault: FilterPerceptionModel {
    //    TODO
}
