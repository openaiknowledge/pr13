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
        
        // BRAIN
        let brain = buildBrain(brainContext: brainContext)
        let environmentContext = EnvironmentContextDefault()
        
        // ENVIRONMENT
        let environment = buildEnvironment(
            with: environmentContext,
            perceptionLayer: brain.perceptionLayer)
        
        if let actionLayer = brain.actionLayer as? ActionLayerDefault {
            actionLayer.setup(with: environment.eventsDispatcher)
        }
        // MAINTENANCE
        let maintenance = buildMaintenance(with: brain)
        
        return DependencyFactoryDefault(
            brainContext: brainContext,
            brain: brain,
            environmentContext: environmentContext,
            environment: environment,
            brainMaintenance: maintenance)
    }
}
// MARK: - private build helper functions
private extension DependencyFactoryDefault {
    static func buildBrain(
        brainContext: BrainContext) -> Brain {
        
        // layers
        let learningLayer = LearningLayerDefault(
            context: brainContext)

        let memoryLayer = MemoryLayerDefault(
            context: brainContext)

        let knowledgeLayer = KnowledgeLayerDefault(context: brainContext, learningLayer: learningLayer, memoryLayer: memoryLayer)
        
        let actionLayer = ActionLayerDefault.build(context: brainContext)
        
        let reactiveLayer = ReactiveLayerDefault.build(context: brainContext, memoryLayer: memoryLayer, actionLayer: actionLayer, knowledgeLayer: knowledgeLayer)
        
        let perceptionLayer = PerceptionLayerDefault.build(with: brainContext, reactiveLayer: reactiveLayer, learningLayer: learningLayer)
        
        let proactiveLayer = ProactiveLayerDefault(
            context: brainContext,
            memoryLayer: memoryLayer,
            actionLayer: actionLayer,
            knowledgeLayer: knowledgeLayer)
                                
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
        
        let sightInputController = SightInputControllerDefault(
            context: environmentContext,
            eventGenerator: eventGenerator,
            perceptionLayer: perceptionLayer)

        let imageOutputController = ImageOutputControllerDefault(context: environmentContext)
        
        let outputSystems = [imageOutputController]
        let eventsDispatcher = EventsDispatcherDefault(outputSystems: outputSystems)
        
        let environment = EnvironmentDefault(
            context: environmentContext,
            eventsDispatcher: eventsDispatcher,
            sightInputController: sightInputController,
            imageOutputController: imageOutputController,
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
    
    // MARK: systems
    func resolve() -> SightInputController {
        return environment.sightInputController
    }
    func resolve() -> ImageOutputController {
        return environment.imageOutputController
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
