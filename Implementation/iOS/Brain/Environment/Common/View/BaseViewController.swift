//  QuestionAnswerProtocols.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
import UIKit

class BaseViewController: UIViewController {

    // MARK: - IBOutlets

    // MARK: - Properties
	var presenter: Presenter?
    
    // MARK: - Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.viewWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presenter?.viewDidAppear()
    }
}
// MARK: - VIPERView
extension BaseViewController: VIPERView {

}
