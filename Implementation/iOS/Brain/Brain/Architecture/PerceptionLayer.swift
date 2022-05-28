//  PerceptionLayer.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Base protocols for Perception layer

protocol PerceptionLayer: Layer, AnyObject {
    // MARK: access to other Layers
    var reactiveLayer: ReactiveLayer { get }
    var learningLayer: LearningLayer { get }
    
    // functions
    func event(_ event: Event)
}

// MARK: - activity
protocol MapperEventToSignalActivity: Activity {
    
}
protocol RepresentationOfSignaltActivity: Activity {
    
}
protocol FilterPerceptionActivity: Activity {
    
}

// MARK: - models
protocol MapperEventToSignalModel: ActivityModel {
    
}

protocol RepresentationOfSignaltModel: ActivityModel {
    
}

protocol FilterPerceptionModel: ActivityModel {
    
}
