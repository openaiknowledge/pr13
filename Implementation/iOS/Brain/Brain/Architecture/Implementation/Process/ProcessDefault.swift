//  ProcessDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
import Foundation

class ProcessDefault {
    
    var model: ProcessModel
    var status: ProcessStatus = ProcessStatusDefault.idle
    var activities = WeakArray<Activity>()
    var nextLayers = WeakArray<Layer>()
    
    init(model: ProcessModel) {
        self.model = model
    }
}

// MARK: - Signal
struct SignalDefault: Signal {
    var messages: [BrainData]
    var processStatus: [ProcessStatus]

}
extension ProcessDefault: Process {
   
}
