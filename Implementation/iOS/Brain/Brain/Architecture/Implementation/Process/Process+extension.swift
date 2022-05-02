//  PerceptionProcess.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Default implementation of Process
import Foundation

// MARK: - exec
extension Process {
    func exec(signal: Signal) {
        DispatchQueue(label: self.queueName).async {
            var input = signal
            activities.forEach {
                input = $0.exec(signal: input)
            }
            nextLayers.forEach { layer in
                layer.signal(input)
            }
        }
    }
}

// MARK: - queueName
extension Process {
    var queueName: String {
        return String(describing: type(of: self))
    }
}
