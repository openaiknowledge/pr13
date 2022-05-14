//  QuestionAnswerConfigurator.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Particular use of Sight System to test
//  1º test is:
/*
    - Was Albert Einstein born in Switzerland? -> NO
    - Was Albert Einstein born in Germany? -> YES
    - Was Albert Einstein born in Spain? -> NO
 */
import UIKit

class QuestionAnswerConfigurator: HasDependencies {

    func createModule() -> UIViewController  {

        let inputController: SightInputController = dependencies.resolve()
        let view = QuestionAnswerViewController()
        let interactor: SightInteractorDefault = SightInteractorDefault()
        let router: SightRouter = SightRouterDefault(mainRouter: MainRouterDefault(parentVC: view))
        
        let presenter: QuestionAnswerPresenterDefault = QuestionAnswerPresenterDefault(
            inputController: inputController,
            interactor: interactor,
            router: router)
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
   
}
