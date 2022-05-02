//  ProcessStatusDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Default implementation of BrainData
import Foundation

struct BrainDataDefault: BrainData {
    
    enum Constant {
        static var dataTypeConversion: String.Encoding = .utf32
    }
    
    enum ´Type´ {
        case image
        case text
        case sound // voice?
    }
    let type: ´Type´
    let data: Data
}
