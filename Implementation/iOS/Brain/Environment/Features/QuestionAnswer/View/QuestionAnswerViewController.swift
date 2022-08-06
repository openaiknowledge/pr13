//  QuestionAnswerViewController.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
import UIKit

class QuestionAnswerViewController: EnvironmentViewController {
    // MARK: - Properties
    
    // MARK: - IBOutlets
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var answerTextView: UITextView!

}
// MARK: -
extension QuestionAnswerViewController: QuestionAnswerView {
    func show(question: String) {
        questionTextView.text = question
    }
    func show(answer: String) {
        answerTextView.text = answer
    }
}

// MARK: - Life Cycle
extension QuestionAnswerViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
        
    }
    
}

// MARK: - actions
private extension QuestionAnswerViewController {
    
    @IBAction func executeAction(_ sender: UIButton) {
        guard let text = questionTextView.text else { return }
        presenter?.execute(text: text)
        
    }
}
// MARK: - EnvironmentView
extension QuestionAnswerViewController: EnvironmentView {
    
    func show(text: String) {
        answerTextView.text = text
//        showAlertController(titleAction: "TESTING", descriptionAction: text, titleOne: "Cancel", titleSecond: "OK")
    }
    
    func show(image: UIImage) {
//         TODO
    }
    func clean() {
        answerTextView.text = nil        
    }
}
