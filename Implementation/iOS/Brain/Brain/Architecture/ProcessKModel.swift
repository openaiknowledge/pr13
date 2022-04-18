//  ProcessModel.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//

// MARK: - Reactive
// Environment produces an event and brain react with a new event to the environment
protocol ReactiveProcessModel: ProcessModel {
   
}

// MARK: - Proactive
// It manages the process executing in background when none other process is executing. Knowledge + Memory -> Proactive
// It manages complex reasoning processes where an internal conclusion can fire another one and so on
protocol ProactiveProcessKModel: ProcessModel {
   
}
// MARK: - Memorization
// It manages process started by an event of reactive, proactive or action layer and memorize it
protocol MemorizationProcessKModel: ProcessModel {
   
}

// MARK: - Remember
// It manages process started by an request of reactive, proactive or knowledge layer and response with info memorized
protocol RememberProcessKModel: ProcessModel {
   
}

// MARK: - Learning
/* It manages process started in background when none other is executing. It tries to generate new rules.
(The learned rules resulting from these processes are provisionally saved in the long-term memory and experimented. Rule whose experimentation has been positive are permanently stored in the long-term memory).
Social learning process is more complex: it involves concepts such as trust, competence, roles … is based on imitation processes

the acquired information must be experimented before being incorporated into the agent’s knowledge base
*/
protocol LearningProcessKModel: ProcessModel {
   
}

// MARK: - Knowledge
protocol KnowledgeProcessKModel: ProcessModel {
   
}

