//  ImageSystemDefault.swift
//  Environment
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Default implementation of Image System
import Foundation

// MARK: - ImageOutputController
class ImageOutputControllerDefault {
    let context: EnvironmentContext
    var presenter: EnvironmentPresenter?
    
    init(context: EnvironmentContext) {
        self.context = context
    }
}
// MARK: - ImageOutputController
extension ImageOutputControllerDefault: ImageOutputController {
    func output(data: BrainData) {
        if let brainData = data as? BrainDataDefault {
            switch brainData.encoding {
            case .txt(let encoding):
                if let text = String(data: brainData.data, encoding: encoding) {
                    show(text: text)
                }
            case .image(let imageType):
                break
            default:
                break
            }

        }
    }
    func show(text: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.presenter?.show(text: text)
        }
    }
    
    func show(image: Data, type: BrainDataDefault.ImageType) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.presenter?.show(image: image, type: type)
        }
    }
    
}
