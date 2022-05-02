//  QuestionAnswerProtocols.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
import UIKit

class QuestionAnswerConfigurator: HasDependencies {

    func createModule() -> UIViewController  {

        let inputController: SightInputController = dependencies.resolve()
        let view = QuestionAnswerViewController()
        let interactor: SightInteractorDefault = SightInteractorDefault()
        let router: SightRouter = SightRouterDefault(mainRouter: MainRouterDefault(parentVC: view))
        
        let presenter: SightPresenterDefault = SightPresenterDefault(
            inputController: inputController,
            interactor: interactor,
            router: router)
        
        view.presenter = presenter
        
//        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
   
}
