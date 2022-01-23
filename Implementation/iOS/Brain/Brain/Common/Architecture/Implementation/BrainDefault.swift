//  BrainDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  

struct BrainDefault: Brain {
    var perceptionLayer: PerceptionLayer
    
    var actionLayer: ActionLayer
    
    var reactiveLayer: ReactiveLayer
    
    var proactiveLayer: ProactiveLayer
    
    var learningLayer: LearningLayer
    
    var memoryLayer: MemoryLayer
    
    var knowledgeLayer: KnowledgeLayer
    
    var context: BrainContext
    
   
}
