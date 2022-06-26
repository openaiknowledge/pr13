//  QuestionAnsweringReactiveActivityDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// Default implementation of QuestionAnsweringReactiveActivity
// TODO: For now, I include QuestionAnsweringBERT

import Foundation
import Logging

// MARK: - QuestionAnsweringReactiveActivityDefault
class QuestionAnsweringReactiveActivityDefault {
    enum Constants {
        static let defaultDoc = "The quick brown fox jumps over the lethargic dog."
    }
    
    var activityModels: [ActivityModel]
    let questionAnsweringBERT: QuestionAnsweringBERT
    init(activityModels: [ActivityModel]) {
        self.activityModels = activityModels
        let modelProvider = ModelProviderBERT()
        questionAnsweringBERT = QuestionAnsweringBERT(modelProviding: modelProvider)
    }
}
// TODO
// For now I use directly QuestionAnsweringBERT
extension QuestionAnsweringReactiveActivityDefault: QuestionAnsweringReactiveActivity {
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process) -> Signal? {
        guard let data = signal.messages.first as? BrainDataDefault,
              let questionStr = data.txt else { return nil }
        let questionDocument = QuestionDocument(question: questionStr, document: getDocumentation())

        guard let questionDocumentData = questionDocument.map() else {
            Logger(label: String(describing: self)).info("Document not found for signal: \(signal)")
            return nil
        }
        let questionDocumentBrainData = BrainDataDefault(type: .text, encoding: .json, data: questionDocumentData)
        let question = QuestionDefault(data: questionDocumentBrainData)
        guard let answer = questionAnsweringBERT.findAnswer(to: question) else {
            Logger(label: String(describing: self)).info("Answer not fount for signal: \(signal)")
            return nil
            
        }
        
        let message = answer.data
        let status: ProcessStatusDefault = .ended
        return SignalDefault(messages: [message], processStatus: [status])
    }
}
// MARK: - build
extension QuestionAnsweringReactiveActivityDefault {
    static func build() -> QuestionAnsweringReactiveActivityDefault {
        let model = QuestionAnsweringModelDefault()
        return QuestionAnsweringReactiveActivityDefault(activityModels: [model])
    }
}
// MARK: - helper functions
extension QuestionAnsweringReactiveActivityDefault {
    // TODO: memory? knowledge? we need to resolve this. Where should this be resolve?
    func getDocumentation() -> String {
        return Constants.defaultDoc
    }
}
// MARK: - models
class QuestionAnsweringModelDefault: QuestionAnsweringModel {
    
}
