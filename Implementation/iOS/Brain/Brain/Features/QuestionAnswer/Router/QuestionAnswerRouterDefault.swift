import Foundation

class QuestionAnswerRouterDefault: BaseRouter {

    var mainRouter: MainRouter

    init(mainRouter: MainRouter) {
        self.mainRouter = mainRouter
    }

}

extension QuestionAnswerRouterDefault: QuestionAnswerRouter {
    
}
