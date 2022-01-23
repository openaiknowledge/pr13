//  Brain
//
//  Created by Miguel Gutierrez on 23/01/22.
//

import Foundation
/* TODO
import Alamofire

enum APIRouter {
    case videoList(model: VideoListRequest)
    case videoListWithDetail(model: VideoDetailListRequest)
    case commentList(model: CommentListRequest)
}

extension APIRouter: APIRoutable {
    
    func asURLRequest(constants: ConstantsStore) -> URLRequest? {
        let baseUrl = constants.youtubeUrl
        
        let url = baseUrl+path+parameters
        guard let urlURL = URL(string: url) else {
            return nil            
        }
        
        var urlRequest = URLRequest(url:urlURL)
        urlRequest.httpMethod = method.rawValue

        // Set timeout
        urlRequest.timeoutInterval = 30
       
        return urlRequest
    }
    
}
extension APIRouter {

    // MARK: HTTPMethod
    var method: HTTPMethod {
        return .get
    }
    
    // MARK: EndPoint
    var path: String {
        switch self {
        case .videoList:
            return "/search?"
        case .videoListWithDetail:
            return "/videos?"
        case .commentList:
            return "/commentThreads?"
        }
    }
    var parameters: String {
        switch self {
        case .videoList(let model):
            var params = [
                "channelId": model.channelId,
                "key": model.key,
                "order": model.order,
                "maxResults": String(model.maxResults)
            ]
            if let pageToken = model.pageToken {
                params["pageToken"] = pageToken
            }
            return URLEncoding().query(params)
        case .videoListWithDetail(let model):
            let idList = model.list.joined(separator: ",")
            let params = [
                "id": idList,
                "key": model.key,
                "part": "snippet,contentDetails"
            ]
            return URLEncoding().query(params)
        case .commentList(let model):   // ordered by time (default)
            var params = [
                "key": model.key,
                "videoId": model.videoId,
                "part": "snippet,id",
                "maxResults": String(model.maxResults)
            ]
            if let pageToken = model.pageToken {
                params["pageToken"] = pageToken
            }
            return URLEncoding().query(params)
        }
        
    }
}
// MARK: - URLEncoding
extension URLEncoding {
    func query(_ parameters: [String: Any]) -> String {
        var components: [(String, String)] = []
        for key in parameters.keys.sorted(by: <) {
            let value = parameters[key]
            components += queryComponents(fromKey: key, value: value ?? "")
        }
        return components.map { "\($0)=\($1)" }.joined(separator: "&")
    }
}
*/
