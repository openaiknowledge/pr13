//  QuestionAnswerProtocols.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//

import UIKit

// MARK: - QuestionAnswer
protocol QuestionAnswerView: EnvironmentView {
    func show(question: String)
    func show(answer: String)
}

protocol QuestionAnswerPresenter: EnvironmentPresenter {
}

protocol QuestionAnswerInteractorCallback: EnvironmentInteractorCallback {
   
}

protocol QuestionAnswerInteractor: EnvironmentInteractor {
   
}

protocol QuestionAnswerRouter: EnvironmentRouter {
   
}
