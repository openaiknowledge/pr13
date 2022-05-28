//  PerceptionProcess.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Default implementation of Process
import Foundation

// MARK: - exec
extension Process {
    //     execute activities in order - default exec
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process?) {
        DispatchQueue(label: self.queueName).async { [weak self] in
            guard let self = self else { return }
            var input = signal
            self.activities.forEach {
                if let activity = $0() {
                    input = activity.exec(signal: input, fromLayer: fromLayer, fromProcess: self)
                }
            }
            self.nextLayers.forEach {
                if let layer = $0() {
                    layer.signal(input, fromLayer: fromLayer, fromProcess: self)
                }
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
