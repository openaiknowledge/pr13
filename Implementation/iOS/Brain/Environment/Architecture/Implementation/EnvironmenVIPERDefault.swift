//  EnvironmenVIPERDefault.swift
//  Environment
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Default implementation of Environmen VIPER modules
import UIKit

// MARK: - EnvironmentViewController
class EnvironmentViewController: BaseViewController {
    var presenter: EnvironmentPresenter?
    
}
// MARK: - EnvironmentView
extension EnvironmentViewController: EnvironmentView {
    func show(text: String) {
        showAlertController(titleAction: "TESTING", descriptionAction: text, titleOne: "Cancel", titleSecond: "OK")
    }
    
    func show(image: UIImage) {
//         TODO
    }
    
}
// MARK: - helpers
private extension EnvironmentViewController {
    // MARK: - UIAlertController
    func showAlertController(withSender sender: AnyObject? = nil, completionOneBlock: (() -> Void)? = nil, completionTwoBlock: (() -> Void)? = nil, titleAction:String, descriptionAction:String,  titleOne:String, titleSecond:String) {
        // 1
        let optionMenu = UIAlertController(title: titleAction, message: descriptionAction, preferredStyle: .alert)

        // 2
        let oneAction = UIAlertAction(title: titleOne, style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            if let completion = completionOneBlock{
                completion()
            }
        })
        let twoAction = UIAlertAction(title: titleSecond, style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            if let completion = completionTwoBlock{
                completion()
            }
        })

        // 4
        optionMenu.addAction(oneAction)
        optionMenu.addAction(twoAction)

        if let popoverController = optionMenu.popoverPresentationController {
            if let barButton = sender as? UIBarButtonItem{
                popoverController.barButtonItem = barButton
            }else{
                popoverController.sourceView = self.view
                popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                popoverController.permittedArrowDirections = []
            }
        }else{
            optionMenu.modalPresentationStyle = .popover
        }

        // 5
        self.present(optionMenu, animated: true, completion: nil)
    }
}
// MARK: - EnvironmentPresenter
class EnvironmentPresenterDefault {
    var sightController: SightInputController
    var imageController: ImageOutputController
    
    weak var view: EnvironmentView?
    var interactor: EnvironmentInteractor?
    var router: EnvironmentRouter?
    
    init(sightController: SightInputController,
         imageController: ImageOutputController,
         interactor: EnvironmentInteractor?,
         router: EnvironmentRouter?) {
        self.sightController = sightController
        self.imageController = imageController
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - EnvironmentPresenter
extension EnvironmentPresenterDefault: EnvironmentPresenter {

    func viewDidLoad() {
        
    }
    
    @objc func viewWillAppear() {
        
    }
    
    func viewDidAppear() {
        
    }
    
    func execute(text: String) {
        sightController.input(text: text)
    }
    
    func execute(image: UIImage) {
        guard let data = image.pngData() else {
            view?.show(error: .sightInputController)
            return
        }
        
        sightController.input(image: data, type: .png)
    }
    
    func show(text: String) {
        view?.show(text: text)
    }
    
    func show(image: Data, type: BrainDataDefault.ImageType) {
        // TODO: ImageType?
        if let uiImage = UIImage(data: image) {
            view?.show(image: uiImage)
        }
    }

    
}
// MARK: - EnvironmentPresenter
extension EnvironmentPresenterDefault: EnvironmentInteractorCallback {

}

// MARK: - EnvironmentInteractor
class EnvironmentInteractorDefault: EnvironmentInteractor {
    weak var presenter: EnvironmentInteractorCallback?
    
}

// MARK: - EnvironmentRouter
class EnvironmentRouterDefault: EnvironmentRouter {
    let mainRouter: MainRouter
    
    init(mainRouter: MainRouter) {
        self.mainRouter = mainRouter
    }
}
