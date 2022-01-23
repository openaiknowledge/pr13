import UIKit

class QuestionAnswerViewController: UIViewController {

    // MARK: - IBOutlets

    // MARK: - Properties
	var presenter: QuestionAnswerPresenter?
    
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

extension QuestionAnswerViewController: QuestionAnswerView {

}
