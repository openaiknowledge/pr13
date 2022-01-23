import Foundation
import UIKit

// swiftlint:disable type_body_length file_length

class MainRouterDefault: BaseRouter, MainRouter {
    var parentVC: UIViewController?
    
    init(parentVC: UIViewController?) {
        self.parentVC = parentVC
    }


    // MARK: - QuestionAnswer
    func navigateToQuestionAnswer() {
        let module = AppModules.createQuestionAnswerModule()
        parentVC?.navigationController?.pushViewController(module, animated: true)
    }
        
    // MARK: - Navigation Helpers
    func navigateBack() {
        self.parentVC?.navigationController?.popViewController(animated: true)
    }
    
    func dismissView(animated: Bool) {
        self.parentVC?.dismiss(animated: animated, completion: nil)
    }

    func dismissRootViewController() {
        self.parentVC?.navigationController?.viewControllers.first?.dismiss(animated: true, completion: nil)
    }
    
    func navigateToRootViewController() {
        self.parentVC?.navigationController?.popToRootViewController(animated: true)
    }

}
