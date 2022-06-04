//  SightSystemDefault.swift
//  Environment
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Default implementation of Sight System
import UIKit

// MARK: - SightInputController
class SightInputControllerDefault {
    let context: EnvironmentContext
    let eventGenerator: EventGenerator
    var perceptionLayer: PerceptionLayer
    
    init(context: EnvironmentContext,
         eventGenerator: EventGenerator,
         perceptionLayer: PerceptionLayer) {
        self.context = context
        self.eventGenerator = eventGenerator
        self.perceptionLayer = perceptionLayer
    }
}
// MARK: - SightInputController
extension SightInputControllerDefault: SightInputController {

    func input(data: BrainData) {
        
        let event = eventGenerator.generate(data: data)
        perceptionLayer.event(event)

    }
    
    func input(text: String) {
        let encoding = BrainDataDefault.Constant.txtEncodingDefault
        guard let data = text.data(using: encoding) else { return }
        
        let brainData = BrainDataDefault(type: .text, encoding: .txt(encoding), data: data)
        input(data: brainData)
        
    }
    
    func input(image: Data, type: BrainDataDefault.ImageType) {
        
        let brainData = BrainDataDefault(type: .image, encoding: .image(type), data: image)
        input(data: brainData)

    }
    
}
