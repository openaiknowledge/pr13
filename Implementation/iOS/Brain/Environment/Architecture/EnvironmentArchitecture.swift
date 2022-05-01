//  EnvironmentArchitecture.swift
//  Environment
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Base protocols to define Environment Architecture

import Foundation  // Date

// MARK: Environment
protocol Environment {
    var context: EnvironmentContext { get }

    // Systems
    var sight: SightInputController { get }


    // access to others
    var brain: Brain { get }
    var perceptionLayer: PerceptionLayer { get }
}

// MARK: general extension
extension Environment {
    var perceptionLayer: PerceptionLayer {
        return brain.perceptionLayer
    }
}

// MARK: - EnvironmentContext
protocol EnvironmentContext: Context {
    
}


// MARK: - System Controller
protocol SystemInputController {
    var context: EnvironmentContext { get }
    var eventGenerator: EventGenerator  { get }
}
protocol SystemOutputController {
    var context: EnvironmentContext { get }
    var signalMapper: Signal { get }
}

// MARK: - Event
protocol Event: Signal {
    var date: Date  { get }
}

protocol EventGenerator {
    func generate() -> Event
}

protocol SignalMapper {
    associatedtype T
    func map(signal: Signal) -> T
}

// MARK: - SightSystem
protocol SightView: VIPERView {
//   normally empty because out info will be in others Systems: ImageSystem, VoiceSystem,...
}

protocol SightPresenter: Presenter {
    var inputController: SightInputController { get }
}

protocol SightInteractorCallback: InteractorCallback {
   
}

protocol SightInteractor: Interactor {
   
}

protocol SightRouter: Router {
   
}

protocol SightInputController: SystemInputController {
    
}
