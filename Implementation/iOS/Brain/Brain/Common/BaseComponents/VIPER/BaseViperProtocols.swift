//  BaseViperProtocols.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//  Base protocols for implementing VIPER classes in modules
import UIKit

protocol BaseView: AnyObject {
   
}

protocol BasePresenter: AnyObject {
   func viewDidLoad()
   func viewWillAppear()
   func viewDidAppear()
}

protocol BaseInteractor: AnyObject {
   
}

protocol BaseInteractorToPresenter: AnyObject {
   
}

protocol BaseRouter: AnyObject {
   
}

