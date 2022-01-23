//  Brain
//
//  Created by Miguel Gutierrez on 23/01/22.
//
import Foundation

protocol APIRoutable {
    func asURLRequest(constants: ConstantsStore) -> URLRequest?
}
