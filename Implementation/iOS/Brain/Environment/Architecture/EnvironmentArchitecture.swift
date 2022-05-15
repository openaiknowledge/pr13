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

    // Systems
    var sight: SightInputController { get }

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
    var perceptionLayer: PerceptionLayer  { get }

    // functions
    func input(data: BrainData)
    
}
protocol SystemOutputController {
    var context: EnvironmentContext { get }
    var signalMapper: Signal { get }
}

// MARK: - Event
protocol Event {
    var date: Date  { get }
    var signal: Signal { get }
}

protocol EventGenerator {
    func generate(data: BrainData) -> Event
}

protocol SignalMapper {
    associatedtype T
    func map(signal: Signal) -> T
}

protocol SightInputController: SystemInputController {
    func input(text: String)
    func input(image: Data, type: BrainDataDefault.ImageType)
    
}

// MARK: - SightSystem
protocol SightView: VIPERView {
//   normally empty because out info will be in others Systems: ImageSystem, VoiceSystem,...
}

protocol SightPresenter: Presenter {
    var inputController: SightInputController { get }
    func execute(text: String)
    func execute(image: UIImage)
}

protocol SightInteractorCallback: InteractorCallback {
   
}

protocol SightInteractor: Interactor {
   
}

protocol SightRouter: Router {
   
}

// MARK: - Error
enum EnvironmentError: Error {
    case sight
}
