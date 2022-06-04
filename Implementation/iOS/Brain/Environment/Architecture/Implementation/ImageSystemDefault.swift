//  ImageSystemDefault.swift
//  Environment
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Default implementation of Image System
import UIKit

// MARK: - ImageOutputController
class ImageOutputControllerDefault {
    let context: EnvironmentContext
    
    init(context: EnvironmentContext) {
        self.context = context
    }
}
// MARK: - ImageOutputController
extension ImageOutputControllerDefault: ImageOutputController {
    func show(text: String) {
        // TODO
    }
    
    func show(image: Data, type: BrainDataDefault.ImageType) {
//        TODO
    }
    
}
