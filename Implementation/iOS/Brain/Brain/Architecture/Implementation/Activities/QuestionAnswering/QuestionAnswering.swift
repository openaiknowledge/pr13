//  QuestionAnswering.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Base protocols for QuestionAnswering Activity
//  TODO: study to generalize with ProblemSolving architecture, Find Objects problem,...

import SwiftUI
protocol QuestionAnswering {
    func findAnswer(to question: Question) -> Answer?
}

protocol Question {
    var data: BrainData { get }
}

protocol Answer {
    var label: String { get } // generic data for future use
    var confidence: Double { get } // generic data for future use ¿?
    var data: BrainData { get } 
}

struct QuestionDocument: Codable {
    let question: String
    let document: String

    func map() -> Data? {
        return try? JSONEncoder().encode(self)
        
    }
}
extension Data {
    func map() -> QuestionDocument? {
        try? JSONDecoder().decode(QuestionDocument.self, from: self)
    }
}
