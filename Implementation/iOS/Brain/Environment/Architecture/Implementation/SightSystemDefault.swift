//  SightSystemDefault.swift
//  Environment
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Default implementation of Sight System
import UIKit

// MARK: - SightInputController
class SightInputControllerDefault: SightInputController {
    let context: EnvironmentContext
    let eventGenerator: EventGenerator
    
    init(context: EnvironmentContext, eventGenerator: EventGenerator) {
        self.context = context
        self.eventGenerator = eventGenerator
    }
}

// MARK: - SightViewController
class SightViewController: BaseViewController {

    
}
// MARK: - SightView
extension SightViewController: SightView {

}
// MARK: - SightPresenter
class SightPresenterDefault {
    var inputController: SightInputController
    
    weak var view: SightView?
    var interactor: SightInteractor?
    var router: SightRouter?
    
    init(inputController: SightInputController, view: SightView?, interactor: SightInteractor?, router: SightRouter?
    ) {
        self.inputController = inputController
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - SightPresenter
extension SightPresenterDefault: SightPresenter {
    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        
    }
    
    func viewDidAppear() {
        
    }
    
}
// MARK: - SightPresenter
extension SightPresenterDefault: SightInteractorCallback {

}

// MARK: - SightInteractor
class SightInteractorDefault: SightInteractor {
    weak var presenter: SightInteractorCallback?
    
}

// MARK: - SightRouter
class SightRouterDefault: SightRouter {
    let mainRouter: MainRouter
    
    init(mainRouter: MainRouter) {
        self.mainRouter = mainRouter
    }
}
