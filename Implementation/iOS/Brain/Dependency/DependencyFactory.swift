//  Brain
//
//  Created by Miguel Gutierrez on 23/01/22.
//

protocol DependencyFactory {
    // MARK: main level
    func resolve() -> Environment
    func resolve() -> EnvironmentContext
    
    func resolve() -> Brain
    func resolve() -> BrainContext
    func resolve() -> BrainMaintenance

    // MARK: systems
    func resolve() -> SightInputController
    func resolve() -> ImageOutputController
    
    // MARK: others
    func resolve() -> ConstantsStore
    func resolve() -> APIClient

}
