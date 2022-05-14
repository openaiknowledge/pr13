//  SightSystemDefault.swift
//  Environment
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Default implementation of Sight System
import UIKit

// MARK: - SightInputController
class SightInputControllerDefault {
    let context: EnvironmentContext
    let eventGenerator: EventGenerator
    let perceptionLayer: PerceptionLayer
    
    init(context: EnvironmentContext,
         eventGenerator: EventGenerator,
         perceptionLayer: PerceptionLayer) {
        self.context = context
        self.eventGenerator = eventGenerator
        self.perceptionLayer = perceptionLayer
    }
}
// MARK: - SightInputController
extension SightInputControllerDefault: SightInputController {

    func input(data: BrainData) {
        
        let event = eventGenerator.generate(data: data)
        perceptionLayer.event(event)

    }
    
    func input(text: String) {
        guard let data = text.data(using: BrainDataDefault.Constant.dataTypeConversion) else { return }
        
        let brainData = BrainDataDefault(type: .text, data: data)
        input(data: brainData)
        
    }
    
    func input(image: Data) {
        
        let brainData = BrainDataDefault(type: .image, data: image)
        input(data: brainData)

    }
    
}

// MARK: - SightViewController
class SightViewController: BaseViewController {
    var presenter: SightPresenter?
    
}
// MARK: - SightView
// only for show errors, because Sight System doesn´t show view info
extension SightViewController: SightView {
}

// MARK: - SightPresenter
class SightPresenterDefault {
    var inputController: SightInputController

// Sight does not have view output, only for errors
    weak var view: SightView?
    var interactor: SightInteractor?
    var router: SightRouter?
    
    init(inputController: SightInputController,
         interactor: SightInteractor?,
         router: SightRouter?) {
        self.inputController = inputController
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - SightPresenter
extension SightPresenterDefault: SightPresenter {
    
    func viewDidLoad() {
        
    }
    
    @objc func viewWillAppear() {
        
    }
    
    func viewDidAppear() {
        
    }
    
    func execute(text: String) {
        inputController.input(text: text)
    }
    
    func execute(image: UIImage) {
        guard let data = image.pngData() else {
            view?.show(error: .sight)
            return
        }
        
        inputController.input(image: data)
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
