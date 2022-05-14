//  QuestionAnswerProtocols.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//

import UIKit

// MARK: - QuestionAnswer
protocol QuestionAnswerView: SightView {
    func show(question: String)
    func show(answer: String)
}

protocol QuestionAnswerPresenter: SightPresenter {
}

protocol QuestionAnswerInteractorCallback: SightInteractorCallback {
   
}

protocol QuestionAnswerInteractor: SightInteractor {
   
}

protocol QuestionAnswerRouter: SightRouter {
   
}
