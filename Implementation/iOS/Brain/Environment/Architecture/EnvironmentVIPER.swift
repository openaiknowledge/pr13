//  EnvironmentArchitecture.swift
//  Environment
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Base protocols to define Environment VIPER

// MARK: - VIPER
import UIKit

protocol EnvironmentView: VIPERView {
    func show(image: UIImage)
    func show(text: String)
}

protocol EnvironmentPresenter: Presenter {
    var sightController: SightInputController { get }
    var imageController: ImageOutputController { get }
    
    func execute(text: String)
    func execute(image: UIImage)
}

protocol EnvironmentInteractorCallback: InteractorCallback {
   
}

protocol EnvironmentInteractor: Interactor {
   
}

protocol EnvironmentRouter: Router {
   
}

// MARK: - Error
enum EnvironmentError: Error {
    case sightInputController
    case image
    case text
}
