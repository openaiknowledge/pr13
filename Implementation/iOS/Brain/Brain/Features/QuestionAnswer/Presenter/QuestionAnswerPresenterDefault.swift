import Foundation

class QuestionAnswerPresenterDefault {
    
    // MARK: - Properties
    weak var view: QuestionAnswerView?
    var interactor: QuestionAnswerInteractor?
    var router: QuestionAnswerRouter?
    
}

extension QuestionAnswerPresenterDefault: QuestionAnswerPresenter {
    func viewDidLoad() {
        
    }

    func viewWillAppear() {
    }

    func viewDidAppear() {
    
    }
        
}

extension QuestionAnswerPresenterDefault: QuestionAnswerInteractorToPresenter {

}


