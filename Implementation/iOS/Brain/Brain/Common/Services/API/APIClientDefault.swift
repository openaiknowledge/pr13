//  Brain
//
//  Created by Miguel Gutierrez on 23/01/22.
//

import Foundation
/* TODO
import Alamofire
import CodableAlamofire
*/
final class APIClientDefault: APIClient {

    private let constants: ConstantsStore
    /* TODO
    lazy var session: Session = {
        let configuration = URLSessionConfiguration.default
    
        configuration.headers = .default
        configuration.urlCache = nil
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        
        return Session(configuration: configuration)
    }()
     */
    init(constants: ConstantsStore) {
        self.constants = constants
    }
    
    func requestObject<T>(from route: APIRoutable, decoder: JSONDecoder = JSONDecoder(), completion: @escaping ((Result<T, Error>) -> Void)) where T: Decodable {
        /* TODO
        guard let urlRequest = route.asURLRequest(constants: constants) else {
            completion(.failure(NSError()))
            return
        }

        session.request(urlRequest).responseDecodableObject(queue: .main, decoder: decoder) { [weak self] (response: DataResponse<T, AFError>) in
            guard let resp = response.response,
                (200...300).contains(resp.statusCode) else {
                if let self = self {
                    completion(.failure(self.decodeError(statusCode: response.response?.statusCode, data: response.data, error: response.error)))
                } else {
                    completion(.failure(NSError()))
                }
                return
            }
            switch response.result {
            case .failure(let error):
                print("response - error: \(error)")

                completion(Result.failure(error))
            case .success(let value):
                completion(Result.success(value))
            }
        }
         */
    }
    
    func readJSON<T>(path: String?, decoder: JSONDecoder = JSONDecoder(), completion: @escaping ((Result<T, Error>) -> Void)) where T: Decodable {

          do {
              if let bundlePath = Bundle.main.path(forResource: path, ofType: "json"),
                  let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                  let decodedData = try decoder.decode(T.self, from: jsonData)
                  completion(Result.success(decodedData))
              } else {
                  completion(Result.failure(NSError()))
              }
          } catch let error {
              completion(Result.failure(error))
          }
          
      }
 

    
}
// MARK: - helpers
fileprivate extension APIClientDefault {
    func decodeError(statusCode: Int?, data: Data?, error: Error?) -> Error {
        
        if let data = data {
            var decodedData = try? JSONDecoder().decode(GenericError.self, from: data)
                     
            decodedData?.statusCode = statusCode
            
            if let errorModel = decodedData {
                return errorModel
            }
        }
        guard let error = error else {
            return NSError()
        }
        
        return error
    }
}

