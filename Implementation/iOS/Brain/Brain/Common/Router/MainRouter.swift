import Foundation
import UIKit

protocol MainRouter {

    // MARK: - QuestionAnswer
    func navigateToQuestionAnswer()
    
    // MARK: - Navigation Helpers
    func navigateBack()
    func dismissView(animated: Bool) 
    func dismissRootViewController()
    func navigateToRootViewController()
    
}
