//  QuestionAnswerProtocols.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
import UIKit

class QuestionAnswerViewController: UIViewController {

    // MARK: - IBOutlets

    // MARK: - Properties
	var presenter: SightPresenter?
    
    // MARK: - Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.viewWillAppear()
    }
}

extension QuestionAnswerViewController: SightView {

}
