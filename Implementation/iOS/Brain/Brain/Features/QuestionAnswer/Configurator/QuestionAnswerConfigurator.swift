import UIKit

class QuestionAnswerConfigurator {

    static func createModule() -> UIViewController  {

        let view = QuestionAnswerViewController()
        let interactor: QuestionAnswerInteractorDefault = QuestionAnswerInteractorDefault()
        let router: QuestionAnswerRouterDefault = QuestionAnswerRouterDefault(mainRouter: MainRouterDefault(parentVC: view))
        let presenter: QuestionAnswerPresenterDefault = QuestionAnswerPresenterDefault()
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
   
}
