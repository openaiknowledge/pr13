//  PerceptionLayer.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Base protocols for implementing Perception Layer

protocol PerceptionLayer: Layer {
    // MARK: access to other Layers
    var reactiveLayer: ReactiveLayer { get }
    var memoryLayer: MemoryLayer { get }

    /* TODO
    // MARK: models
    var kModel: PerceptionKModel { get }

    // MARK: InVoice
    var inVoiceController: InTextController { get }
    var inVoiceEventGenerator: InTextEventGenerator { get }
    
    // MARK: InText
    var inTextController: InTextController { get }
    var inTextEventGenerator: InTextEventGenerator { get }
    */
}

// MARK: InVoice
protocol InVoiceController: Controller {
   
}

protocol InVoiceEventGenerator: EventGenerator {
   
}
// MARK: InText
protocol InTextController: Controller {
   
}

protocol InTextEventGenerator: EventGenerator {
   
}

// MARK: KModel
protocol PerceptionKModel: KModel {
   
}
