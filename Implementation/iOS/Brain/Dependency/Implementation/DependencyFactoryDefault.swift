//  Brain
//
//  Created by Miguel Gutierrez on 23/01/22.
//
// Default implementation of DependencyFactory
// Build order:
//  - Brain
//  - Environment:
//      + update brain data with environment
//  - Maintenance
// TODO: separate Brain/Environment/Maintenance?
class DependencyFactoryDefault {
    
    // Brain
    private lazy var brainContext: BrainContext = {
        return  BrainContextDefault()
    }()

    private lazy var brain: Brain = {
        let context: BrainContext = resolve()
        // layers
        let knowledgeLayer = KnowledgeLayerDefault(context: resolve())
        let memoryLayer = MemoryLayerDefault(context: resolve(), knowledgeLayer: knowledgeLayer)
        let actionLayer = ActionLayerDefault(context: resolve())
        let reactiveLayer = ReactiveLayerDefault(context: resolve(), memoryLayer: memoryLayer, actionLayer: actionLayer)
        let perceptionLayer = PerceptionLayerDefault(context: resolve(), reactiveLayer: reactiveLayer, memoryLayer: memoryLayer)
        let proactiveLayer = ProactiveLayerDefault(context: resolve(), memoryLayer: memoryLayer, actionLayer: actionLayer)
        let learningLayer = LearningLayerDefault(context: resolve(), knowledgeLayer: knowledgeLayer)
        
        // inject other layers in knowledgeLayer
        knowledgeLayer.reactiveLayer = reactiveLayer
        knowledgeLayer.proactiveLayer = proactiveLayer
        
        return BrainDefault(perceptionLayer: perceptionLayer,
                            actionLayer: actionLayer,
                            reactiveLayer: reactiveLayer,
                            proactiveLayer: proactiveLayer,
                            learningLayer: learningLayer,
                            memoryLayer: memoryLayer,
                            knowledgeLayer: knowledgeLayer,
                            context: resolve())
    }()
    
    // Environment
    private lazy var environment: Environment = {
        let environment = EnvironmentDefault(sight: resolve(),
                                  context: resolve(),
                                  perceptionLayer: brain.perceptionLayer)
        
        if var actionLayer = brain.actionLayer as? ActionLayerDefault {
            actionLayer.environment = environment
        }

        return environment
    }()

    private lazy var environmentContext: EnvironmentContext = {
        return  EnvironmentContextDefault()
    }()

    // Maintenance
    private lazy var brainMaintenance: BrainMaintenance = {
        return  BrainMaintenanceDefault(brain: resolve())
    }()

}
// MARK: - DependencyFactory
extension DependencyFactoryDefault: DependencyFactory {
    // MARK: - main level
    open func resolve() -> Environment {
        return environment
    }
    
    func resolve() -> EnvironmentContext {
        return environmentContext
    }
    
    func resolve() -> Brain {
        return brain
    }
    
    func resolve() -> BrainContext {
        return brainContext
    }
    
    func resolve() -> BrainMaintenance {
        return brainMaintenance
    }

    // MARK: Environment - systems
    func resolve() -> SightInputController {
        let brain: Brain = resolve()
        return SightInputControllerDefault(
            context: resolve(),
            eventGenerator: resolve(),
            perceptionLayer: brain.perceptionLayer)
    }
    
    func resolve() -> EventGenerator {
        return EventGeneratorDefault()
    }
    
    // MARK: - Store
    open func resolve() -> ConstantsStore {
        return  ConstantsStoreDefault()
    }

    // MARK: - Service
    open func resolve() -> APIClient {
        return APIClientDefault(constants: resolve())
    }
    
}
