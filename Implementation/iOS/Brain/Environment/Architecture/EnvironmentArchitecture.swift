//  EnvironmentArchitecture.swift
//  Environment
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Base protocols to define Environment Architecture

import Foundation  // Date
import UIKit

// MARK: Environment
protocol Environment: AnyObject {
    var context: EnvironmentContext { get }
    var eventsDispatcher: EventsDispatcher { get }

    // Systems
    var sightInputController: SightInputController { get }
    var imageOutputController: ImageOutputController { get }

    // access to layer
    var perceptionLayer: PerceptionLayer { get }
}

// MARK: - EnvironmentContext
protocol EnvironmentContext: Context {
    
}


// MARK: - System Controller
protocol SystemInputController {
    // Data
    var context: EnvironmentContext { get }
    var eventGenerator: EventGenerator  { get }
    var perceptionLayer: PerceptionLayer  { get set}

    // functions
    func input(data: BrainData)
    
}
protocol SystemOutputController: AnyObject {
    var context: EnvironmentContext { get }
}

// MARK: - Event
protocol Event {
    var date: Date  { get }
    var signal: Signal { get }
}

protocol EventGenerator {
    func generate(data: BrainData) -> Event
}
// it dispatches each event in his correspondent system
protocol EventsDispatcher: AnyObject {
    var systems: WeakArray<SystemOutputController> { get }
    func dispatch(events: [Event])
}
// MARK: - Systems controller
protocol SightInputController: SystemInputController {
    func input(text: String)
    func input(image: Data, type: BrainDataDefault.ImageType)
    
}

protocol ImageOutputController: SystemOutputController {
    func show(text: String)
    func show(image: Data, type: BrainDataDefault.ImageType)
    
}
