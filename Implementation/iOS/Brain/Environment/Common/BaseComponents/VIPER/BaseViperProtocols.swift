//  VIPERViperProtocols.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//  VIPER protocols for implementing VIPER classes in modules
import UIKit
import Logging
protocol VIPERView: AnyObject {
    func show(error: EnvironmentError)
}
extension VIPERView {
    func show(error: EnvironmentError) {
        Logger(label: String(describing: self)).info("Error: \(error)")
    }
}
protocol Presenter: AnyObject {
   func viewDidLoad()
   func viewWillAppear()
   func viewDidAppear()
}

protocol InteractorCallback: AnyObject {
   
}

protocol Interactor: AnyObject {
   
}

protocol Router: AnyObject {
   
}

