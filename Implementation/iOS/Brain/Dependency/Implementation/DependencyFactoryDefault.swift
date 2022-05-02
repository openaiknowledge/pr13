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
    private let brainContext: BrainContext
    private let brain: Brain
    
    // Environment
    private let environmentContext: EnvironmentContext
    private let environment: Environment

    // Maintenance
    private let brainMaintenance: BrainMaintenance

    init(brainContext: BrainContext,
         brain: Brain,
         environmentContext: EnvironmentContext,
         environment: Environment,
         brainMaintenance: BrainMaintenance) {
        self.brainContext = brainContext
        self.brain = brain
        self.environmentContext = environmentContext
        self.environment = environment
        self.brainMaintenance = brainMaintenance
    }
}
// MARK: - build
extension DependencyFactoryDefault {
    static func build() -> DependencyFactoryDefault {
        let brainContext = BrainContextDefault()
        let brain = buildBrain(brainContext: brainContext)
        let environmentContext = EnvironmentContextDefault()
        
        let environment = buildEnvironment(
            with: environmentContext,
            perceptionLayer: brain.perceptionLayer)
        
        if let actionLayer = brain.actionLayer as? ActionLayerDefault {
            actionLayer.environment = environment
        }
        
        let maintenance = buildMaintenance(with: brain)
        
        return DependencyFactoryDefault(brainContext: brainContext, brain: brain, environmentContext: environmentContext, environment: environment, brainMaintenance: maintenance)
    }
}
// MARK: - private build helper functions
private extension DependencyFactoryDefault {
    static func buildBrain(brainContext: BrainContext) -> Brain {
        // layers
        let knowledgeLayer = KnowledgeLayerDefault(
            context: brainContext)
        
        let memoryLayer = MemoryLayerDefault(
            context: brainContext,
            knowledgeLayer: knowledgeLayer)
        
        let actionLayer = ActionLayerDefault(
            context: brainContext)
        
        let reactiveLayer = ReactiveLayerDefault(
            context: brainContext,
            memoryLayer: memoryLayer,
            actionLayer: actionLayer)
        
        let perceptionLayer = PerceptionLayerDefault(
            context: brainContext,
            reactiveLayer: reactiveLayer,
            memoryLayer: memoryLayer)
        
        let proactiveLayer = ProactiveLayerDefault(
            context: brainContext,
            memoryLayer: memoryLayer,
            actionLayer: actionLayer)
        
        let learningLayer = LearningLayerDefault(
            context: brainContext,
            knowledgeLayer: knowledgeLayer)
            
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
                                context: brainContext)

    }

    static func buildEnvironment(with
                    environmentContext: EnvironmentContext,
                    perceptionLayer: PerceptionLayer) -> Environment {
        let eventGenerator = EventGeneratorDefault()
        
        let sight = SightInputControllerDefault(
            context: environmentContext,
            eventGenerator: eventGenerator,
            perceptionLayer: perceptionLayer)
        
        let environment = EnvironmentDefault(
            sight: sight,
            context: environmentContext,
            perceptionLayer: perceptionLayer)

        return environment
    }
    
    static func buildMaintenance(with brain: Brain) -> BrainMaintenance {
        return BrainMaintenanceDefault(brain: brain)
    }
    
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
