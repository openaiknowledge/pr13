//  QuestionAnswerPresenterDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//

import UIKit
// MARK: - EnvironmentPresenter
class QuestionAnswerPresenterDefault: EnvironmentPresenterDefault {
    enum Constants {
//        static let defaultQuestion = "Was Albert Einstein born in Switzerland?"
        static let baseDoc = "The quick brown fox jumps over the lethargic dog."
        static let defaultQuestion = "Who jumped over the dog?"
        static let defaultAnswer = ""
    }
    
    override func viewWillAppear() {
        (view as? QuestionAnswerView)?.show(question: Constants.defaultQuestion)
    }
    
}

extension QuestionAnswerPresenterDefault: QuestionAnswerPresenter {
    
}
