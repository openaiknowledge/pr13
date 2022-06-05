//  QuestionAnswerProtocols.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
import UIKit

class BaseViewController: UIViewController {
    // MARK: - IBOutlets

    // MARK: - Properties
    
    // MARK: - Life Cycle
	
}
// MARK: - helpers
internal extension BaseViewController {
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
// MARK: - VIPERView
extension BaseViewController: VIPERView {

}
