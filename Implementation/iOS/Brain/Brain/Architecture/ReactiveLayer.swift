//  ReactiveLayer.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Base protocols for Reactive layer

protocol ReactiveLayer: Layer {
    // access to process
    var representationProcess: RepresentationReactiveProcess? { get }
    var decisionProcess: DecisionReactiveProcess? { get }
    var reasoningProcess: ReasoningReactiveProcess? { get }
    var learningProcess: LearningReactiveProcess? { get }

    // access to other Layers to output
    var memoryLayer: MemoryLayer { get }
    var actionLayer: ActionLayer { get }

    // access to other Layers to input
    var knowledgeLayer: KnowledgeLayer { get }

}
// MARK: - default implementation
extension ReactiveLayer {
    var representationProcess: RepresentationReactiveProcess? {
        return processes.first { $0 is RepresentationReactiveProcess } as? RepresentationReactiveProcess
    }
    var decisionProcess: DecisionReactiveProcess? {
        return processes.first { $0 is DecisionReactiveProcess } as? DecisionReactiveProcess
    }
    var reasoningProcess: ReasoningReactiveProcess? {
        return processes.first { $0 is ReasoningReactiveProcess } as? ReasoningReactiveProcess
    }
    var learningProcess: LearningReactiveProcess? {
        return processes.first { $0 is LearningReactiveProcess } as? LearningReactiveProcess
    }

}
// MARK: - process
protocol RepresentationReactiveProcess: Process {
    
}
protocol DecisionReactiveProcess: Process {
    
}
protocol CausalProcess: Process {
    
}
protocol ReasoningReactiveProcess: Process {
    
}
protocol LearningReactiveProcess: Process {
    
}

// MARK: - activity
protocol RepresentationOfPerceptionSignalActivity: Activity {
    
}

protocol DecisionReactiveActivity: Activity {
    
    func exec(signals: [Signal], fromLayer: Layer, fromProcess: Process, millisecondsSinceStartedProcess: Double) -> Signal

}

protocol CausalReasoningReactiveActivity: Activity {
    
}

protocol DeductiveReasoningReactiveActivity: Activity {
    
}

protocol InductiveReasoningReactiveActivity: Activity {
    
}

protocol ProblemSolvingReasoningReactiveActivity: Activity {
    
}

protocol SynthesisReasoningReactiveActivity: Activity {
    
}

protocol LearningReactiveActivity: Activity {
    
}

// MARK: - models
protocol RepresentationOfPerceptionSignalModel: ActivityModel {
    
}

protocol DecisionReactiveModel: ActivityModel {
    
}
protocol CausalReasoningReactiveModel: ActivityModel {
    
}

protocol DeductiveReasoningReactiveModel: ActivityModel {
    
}

protocol InductiveReasoningReactiveModel: ActivityModel {
    
}

protocol ProblemSolvingReasoningReactiveModel: ActivityModel {
    
}

protocol SynthesisReasoningReactiveModel: ActivityModel {
    
}

protocol LearningReactiveModel: ActivityModel {
    
}

