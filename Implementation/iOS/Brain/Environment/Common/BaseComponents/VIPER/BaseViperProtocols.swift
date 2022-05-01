//  VIPERViperProtocols.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//  VIPER protocols for implementing VIPER classes in modules
import UIKit

protocol VIPERView: AnyObject {
   
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

