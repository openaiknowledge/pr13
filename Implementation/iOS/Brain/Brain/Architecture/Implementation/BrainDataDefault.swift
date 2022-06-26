//  ProcessStatusDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Default implementation of BrainData
import Foundation
struct TestData: Codable {
    let element: Data
}
struct Elements: Codable {
    let id: String
    let data: TestData
}

struct BrainDataDefault: BrainData {
    
    enum Constants {
        static var txtEncodingDefault: String.Encoding = .unicode
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
        case json
    }
    let type: ´Type´
    
    let encoding: Encoding
    let data: Data

}
extension String.Encoding {
    
}
extension BrainDataDefault {
    var txt: String? {
        switch self.encoding {
        case .txt(let encoding):
            return String(data: data, encoding: encoding)
        default:
            return nil
        }
    }
}
// MARK: - generic builds
extension BrainDataDefault {
    static func build(with text: String) -> BrainDataDefault? {
        let encoding = BrainDataDefault.Constants.txtEncodingDefault
        if let data = text.data(using: encoding) {
            return BrainDataDefault(type: .text, encoding: .txt(encoding), data: data)
        } else {
            return nil
        }
    }
}
extension BrainDataDefault {
    static func buildJSON(with value: QuestionDocument) -> BrainDataDefault? {
        if let data = value.map() {
            return BrainDataDefault(type: .text, encoding: .json, data: data)
        } else {
            return nil
        }
    }
}
