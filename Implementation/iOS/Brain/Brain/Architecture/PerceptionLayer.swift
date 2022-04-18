//  BrainArchitectureProtocols.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Base protocols for Perception layer

import SwiftUI

protocol PerceptionLayer: Layer {
    // MARK: access to other Layers
    var reactiveLayer: ReactiveLayer { get }
    var memoryLayer: MemoryLayer { get }
}

// MARK: - activity
protocol MapperEventToSignalActivity: Activity {
    
}
protocol RepresentationOfSignalWithContextActivity: Activity {
    
}
protocol FilterPerceptionActivity: Activity {
    
}

// MARK: - models
protocol MapperEventToSignalModel: ActivityModel {
    
}

protocol RepresentationOfSignalWithContextModel: ActivityModel {
    
}

protocol FilterPerceptionModel: ActivityModel {
    
}
