//  QuestionAnsweringBERT.swift
//  Brain
//
//  Created by Miguel Gutierrez on 19/06/2022
//
//  Implementation of Question Answering using BERT and
// Based on: https://developer.apple.com/documentation/coreml/model_integration_samples/finding_answers_to_questions_in_a_text_document

import CoreML
import Logging

class QuestionAnsweringBERT {
    
    /// The underlying Core ML Model.
    let modelProviding: ModelProviding
    lazy var model: BERTQAFP16? = {
        return modelProviding.model as? BERTQAFP16
    }()
    
    init(modelProviding: ModelProviding) {
        self.modelProviding = modelProviding
    }
}
// MARK: - QuestionAnsweringBERT
extension QuestionAnsweringBERT: QuestionAnswering {
    func findAnswer(to question: Question) -> Answer? {        
        Logger(label: String(describing: self)).info("findAnswer to: \(question)")
        
        guard let data = question.data as? BrainDataDefault,
              let questionDocument = data.data.map() else { return nil }
        
        if let answerString = findAnswer(for: questionDocument.question, in: questionDocument.document),
           let answerData = BrainDataDefault.build(with: String(answerString)) {
            return AnswerDefault(id: "0", label: "question", confidence: 1.0, data: answerData)
        } else {
            return nil
        }
    }
}
// MARK: - helper functions
private extension QuestionAnsweringBERT {
    /// Finds an answer to a given question by searching a document's text.
    ///
    /// - parameters:
    ///     - question: The user's question about a document.
    ///     - document: The document text that (should) contain an answer.
    /// - returns: The answer string or an error descripton.
    /// - Tag: FindAnswerForQuestionInDocument
    func findAnswer(for question: String, in document: String) -> Substring? {
        // Prepare the input for the BERT model.
        let bertInput = BERTInput(documentString: document, questionString: question)
        
        guard bertInput.totalTokenSize <= BERTInput.maxTokens else {
            var message = "Text and question are too long"
            message += " (\(bertInput.totalTokenSize) tokens)"
            message += " for the BERT model's \(BERTInput.maxTokens) token limit."
            
            Logger(label: String(describing: self)).error(Logger.Message(stringLiteral: message))

            return nil
        }
        
        // The MLFeatureProvider that supplies the BERT model with its input MLMultiArrays.
        let modelInput = bertInput.modelInput!
        
        // Make a prediction with the BERT model.
        guard let prediction = try? model?.prediction(input: modelInput) else {
            let message = "The BERT model is unable to make a prediction."
            Logger(label: String(describing: self)).error(Logger.Message(stringLiteral: message))

            return nil

        }

        // Analyze the output form the BERT model.
        guard let bestLogitIndices = bestLogitsIndices(from: prediction,
                                                       in: bertInput.documentRange) else {
            let message = "Couldn't find a valid answer. Please try again."
            Logger(label: String(describing: self)).error(Logger.Message(stringLiteral: message))

            return nil
        }

        // Find the indices of the original string.
        let documentTokens = bertInput.document.tokens
        let answerStart = documentTokens[bestLogitIndices.start].startIndex
        let answerEnd = documentTokens[bestLogitIndices.end].endIndex
        
        // Return the portion of the original string as the answer.
        let originalText = bertInput.document.original
        return originalText[answerStart..<answerEnd]
    }
}
// MARK: - other necessary implementations
struct QuestionDefault: Question {
    let data: BrainData
}

struct AnswerDefault: Answer {
    let id: String
    let label: String
    let confidence: Double
    var data: BrainData {
        return _data
    }
    
    let _data: BrainDataDefault
    
    init(id: String, label: String, confidence: Double, data: BrainDataDefault) {
        self.id = id
        self.label = label
        self.confidence = confidence
        self._data = data

    }
}

struct ModelProviderBERT: ModelProviding {
    var model: KModel? {
        do {
            return try BERTQAFP16(configuration: .init())
        } catch {
            return nil
        }
    }
}
extension BERTQAFP16: KModel {
}
