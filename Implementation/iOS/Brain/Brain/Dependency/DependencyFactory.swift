//  Brain
//
//  Created by Miguel Gutierrez on 23/01/22.
//

import Foundation
import SwiftUI

protocol DependencyFactory {
    // MARK: main level
    func resolve() -> Environment
    func resolve() -> EnvironmentContext
    
    func resolve() -> Brain
    func resolve() -> BrainContext
    func resolve() -> BrainMaintenance


    // MARK: layers
    func resolve() -> PerceptionLayer
    func resolve() -> ActionLayer
    func resolve() -> ReactiveLayer
    func resolve() -> ProactiveLayer
    func resolve() -> LearningLayer
    func resolve() -> MemoryLayer
    func resolve() -> KnowledgeLayer
    
    // MARK: others
    func resolve() -> ConstantsStore
    func resolve() -> APIClient

}

class DependencyFactoryDefault: DependencyFactory {

    // MARK: - main level
    open func resolve() -> Environment {
        return  EnvironmentDefault(context: resolve(), brain: resolve())
    }
    
    func resolve() -> EnvironmentContext {
        return EnvironmentContextDefault()
    }
    
    func resolve() -> Brain {
        return BrainDefault(perceptionLayer: resolve(), actionLayer: resolve(), reactiveLayer: resolve(), proactiveLayer: resolve(), learningLayer: resolve(), memoryLayer: resolve(), knowledgeLayer: resolve(), context: resolve())
    }
    
    func resolve() -> BrainContext {
        return BrainContextDefault()
    }
    
    func resolve() -> BrainMaintenance {
        return BrainMaintenanceDefault(brain: resolve())
    }

    // MARK: layers
    func resolve() -> PerceptionLayer {
        /*
        let reactiveProcessKModel = ReactiveProcessKModelDefault()
        let reactiveProcess = ProcessDefault(model: reactiveProcessKModel, signalMapper: SignalMapperDefault())
         */
        return PerceptionLayerDefault(context: resolve(), reactiveLayer: resolve(), memoryLayer: resolve())
    }
    func resolve() -> ActionLayer {
        return ActionLayerDefault(context: resolve(), environment: resolve())
    }
    
    func resolve() -> ReactiveLayer {
        return ReactiveLayerDefault(context: resolve(), memoryLayer: resolve(), actionLayer: resolve())
    }
    
    func resolve() -> ProactiveLayer {
        return ProactiveLayerDefault(context: resolve(), memoryLayer: resolve(), actionLayer: resolve())
    }
    
    func resolve() -> LearningLayer {
        return LearningLayerDefault(context: resolve(), knowledgeLayer: resolve())
    }
    
    func resolve() -> MemoryLayer {
        return MemoryLayerDefault(context: resolve(), knowledgeLayer: resolve())
    }
    
    func resolve() -> KnowledgeLayer {
        return KnowledgeLayerDefault(context: resolve(), proactiveLayer: resolve(), reactiveLayer: resolve())
    }
    
    
    // MARK: - Store
    open func resolve() -> ConstantsStore {
        return  ConstantsStoreDefault()
    }

    // MARK: - Service
    open func resolve() -> APIClient {
        return APIClientDefault(constants: resolve())
    }
    
    public init() { }
    
}
