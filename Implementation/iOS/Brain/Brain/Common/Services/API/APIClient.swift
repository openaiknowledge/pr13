//  Brain
//
//  Created by Miguel Gutierrez on 23/01/22.
//

import Foundation

protocol APIClient {
    func requestObject<T: Decodable>(from route: APIRoutable, decoder: JSONDecoder, completion: (@escaping (_: Result<T, Error>) -> Void))
    
    func readJSON<T>(path: String?, decoder: JSONDecoder, completion: @escaping ((Result<T, Error>) -> Void)) where T: Decodable
    
}
extension APIClient {
    func requestObject<T: Decodable>(from route: APIRoutable, completion: (@escaping (_: Result<T, Error>) -> Void)) {
        requestObject(from: route, decoder: JSONDecoder(), completion: completion)
    }
}
