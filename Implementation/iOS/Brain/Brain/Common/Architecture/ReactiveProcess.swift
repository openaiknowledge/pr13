//  ReactiveProcess.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Environment produces an event and brain react with a new event to the environment

protocol ReactiveProcess: Process {
    var controller: ReactiveProcessController { get }
    var model: ReactiveProcessKModel { get }
    var layer: PerceptionLayer { get }
}

// MARK: Controller
protocol ReactiveProcessController: Controller {
   
}

// MARK: KModel
protocol ReactiveProcessKModel: KModel {
   
}

