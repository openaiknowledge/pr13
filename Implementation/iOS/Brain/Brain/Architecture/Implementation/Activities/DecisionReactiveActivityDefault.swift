//  DecisionReactiveActivityDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of DecisionReactiveActivity

// MARK: - DecisionReactiveActivityDefault
/* use signals to take best decision
    choose best action and the action must be enough good
 Use duration time of the process to take the best decision or decide to discard all responses and after a time to generate a response (“I don´t know what to do”,”I don´t know the response”, “Could you give me more info”,...)
*/

class DecisionReactiveActivityDefault {
    var activityModels: [ActivityModel]

    init(activityModels: [ActivityModel]) {
        self.activityModels = activityModels
    }
}
extension DecisionReactiveActivityDefault: DecisionReactiveActivity {

    func exec(signals: [Signal], fromLayer: Layer, fromProcess: Process, millisecondsSinceStartedProcess: Double) -> Signal {

        //  TODO: implement ReactiveModel
        
        let processesStatus = [ProcessStatusDefault.ended]
        var messages: [BrainData] = []
        
        // TODO: manage generic texts
        if millisecondsSinceStartedProcess > 2000, let data = BrainDataDefault.build(with: "I don´t know the answer") {
                messages.append(data)
        }
        
        return SignalDefault(messages: messages, processStatus: processesStatus)

    }
    
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process) -> Signal {
        return exec(signals: [signal], fromLayer: fromLayer, fromProcess: fromProcess, millisecondsSinceStartedProcess: 0)
    }
    
}
// MARK: - build
extension DecisionReactiveActivityDefault {
    static func build() -> DecisionReactiveActivityDefault {
        let model = DecisionReactiveModelDefault()
        return DecisionReactiveActivityDefault(activityModels: [model])
    }
}
// MARK: - models
class DecisionReactiveModelDefault: DecisionReactiveModel {
    
}
