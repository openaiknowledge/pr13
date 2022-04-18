//  Brain
//
//  Created by Miguel Gutierrez on 23/01/22.
//

import Foundation

struct GenericError: Error, Codable {
    var statusCode: Int?
    let code: String?
    let message: String?
}
