//  ProcessStatusDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Default implementation of BrainData
import Foundation

struct BrainDataDefault: BrainData {
    
    enum Constant {
        static var txtEncodingDefault: String.Encoding = .utf8
        static var imageEncodingDefault: ImageType = .png
    }
    
    enum ´Type´ {
        case image
        case text
        case sound // voice?
    }

    enum ImageType {
        case png
        case jpg
    }

    enum Encoding {
        case image(ImageType)
        case txt(String.Encoding)
    }

    let type: ´Type´
    let encoding: Encoding
    let data: Data
}
