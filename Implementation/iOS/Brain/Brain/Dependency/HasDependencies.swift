//  Brain
//
//  Created by Miguel Gutierrez on 23/01/22.
//
protocol HasDependencies { }
extension HasDependencies {
    
    /// Container for dependency instance factories
    var dependencies: DependencyFactory {
        return DependencyInjector.dependencies
    }
}
// Statically store dependency factory in memory.
fileprivate struct DependencyInjector {
    static var dependencies: DependencyFactory = DependencyFactoryDefault()
}
