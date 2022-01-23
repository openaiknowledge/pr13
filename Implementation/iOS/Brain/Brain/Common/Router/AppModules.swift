import Foundation
import UIKit

class AppModules {
    
    class func createMainModule() -> UIViewController {
        return createQuestionAnswerModule()
    }

    // MARK: - Proposals
    class func createQuestionAnswerModule() -> UIViewController {
        return QuestionAnswerConfigurator.createModule()
    }
    
}
