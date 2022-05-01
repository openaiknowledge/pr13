//  ProcessDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//

class ProcessDefault {
    
    var model: ProcessModel
    var status: ProcessStatus = ProcessStatusDefault.idle
    var activities = [Activity]()
    var nextLayers = [Layer]()
    
    init(model: ReactiveProcessModel, status: ProcessStatus = ProcessStatusDefault.idle) {
        self.model = model
        self.status = status
    }
}
extension ProcessDefault: Process {
    func exec(signal: Signal) -> Signal {
        return SignalDefault(messages: [], processStatus: [])
    }
}
// MARK: - Signal
struct SignalDefault: Signal {
    var messages: [BrainData]
    var processStatus: [ProcessStatus]

}


