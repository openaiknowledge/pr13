//  ProcessStatusDefault.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//

import SwiftUI

struct BrainDataDefault: BrainData {
    enum ´Type´ {
        case image
        case text
        case sound // voice?
    }
    let data: Data
}
