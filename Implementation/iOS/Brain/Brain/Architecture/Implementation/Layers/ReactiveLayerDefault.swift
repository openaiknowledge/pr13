//  ReactiveLayerDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of ReactiveLayer
class ReactiveLayerDefault {
    let context: BrainContext
    
    var processes: [Process]
    var activities: [Activity]

    let memoryLayer: MemoryLayer
    let actionLayer: ActionLayer
    
    // MARK: access to other Layers to input
    let knowledgeLayer: KnowledgeLayer
    
    init(context: BrainContext,
         processes: [Process],
         activities: [Activity],
         memoryLayer: MemoryLayer,
         actionLayer: ActionLayer,
         knowledgeLayer: KnowledgeLayer) {
        self.context = context
        self.processes = processes
        self.activities = activities
        self.memoryLayer = memoryLayer
        self.actionLayer = actionLayer
        self.knowledgeLayer = knowledgeLayer
    }
}
// MARK: - build
extension ReactiveLayerDefault {
    static func build(context: BrainContext,
                      memoryLayer: MemoryLayer,
                      actionLayer: ActionLayer,
                      knowledgeLayer: KnowledgeLayer) -> ReactiveLayerDefault {
        let representationOfPerceptionSignalActivity = RepresentationOfPerceptionSignalActivityDefault.build()
        let decisionActivity = DecisionReactiveActivityDefault.build()
        let causalReasoningActivity = CausalReasoningReactiveActivityDefault.build()
        let deductiveReasoningActivity = DeductiveReasoningReactiveActivityDefault.build()
        let inductiveReasoningActivity = InductiveReasoningReactiveActivityDefault.build()
        let problemSolvingReasoningActivity = ProblemSolvingReasoningReactiveActivityDefault.build()
        let questionAnsweringActivity = QuestionAnsweringReactiveActivityDefault.build()
        let synthesisReasoningActivity = SynthesisReasoningReactiveActivityDefault.build()
        let learningActivity = LearningReactiveActivityDefault.build()
        
        let activities: [Activity] = [representationOfPerceptionSignalActivity,
                                      decisionActivity,
                                      causalReasoningActivity,
                                      deductiveReasoningActivity,
                                      inductiveReasoningActivity,
                                      problemSolvingReasoningActivity,
                                      questionAnsweringActivity,
                                      synthesisReasoningActivity,
                                      learningActivity]
                
        let nextLayers: [Layer] = [actionLayer,
                                   memoryLayer]
        
        let causalProcess = CausalProcessDefault.build(with:
                [causalReasoningActivity, problemSolvingReasoningActivity, questionAnsweringActivity],
                                                       nextProcess: [])

        let reasoningProcess = ReasoningReactiveProcessDefault.build(with: [deductiveReasoningActivity, inductiveReasoningActivity, synthesisReasoningActivity], nextProcess: [])

        let learningProcess  = LearningReactiveProcessDefault.build(with: [learningActivity], nextProcess: [])
        
        let processToControl: [Process] = [causalProcess,
                                          reasoningProcess,
                                          learningProcess]
        
        let decisionReactiveProcess = DecisionReactiveProcessDefault.build(with: [decisionActivity], processToControl: processToControl, nextLayers: nextLayers)
        
        causalProcess.addNext(process: decisionReactiveProcess)
        reasoningProcess.addNext(process: decisionReactiveProcess)
        learningProcess.addNext(process: decisionReactiveProcess)

        let representationReactiveProcess = RepresentationReactiveProcessDefault.build(with: [representationOfPerceptionSignalActivity], nextProcess: [decisionReactiveProcess])
        
        let processes: [Process] = [representationReactiveProcess]
        
        return ReactiveLayerDefault(context: context, processes: processes, activities: activities, memoryLayer: memoryLayer, actionLayer: actionLayer, knowledgeLayer: knowledgeLayer)
    }
}
// MARK: - ReactiveLayer
extension ReactiveLayerDefault: ReactiveLayer {
    
    func signal(_ signal: Signal, fromLayer: Layer, fromProcess: Process) {
        processes.forEach { process in
            process.exec(signal: signal, fromLayer: self, fromProcess: nil)
        }
    }
    
}
