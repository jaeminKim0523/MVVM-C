//
//  NetworkModel.swift
//  WantedLibrary
//
//  Created by 김재민 on 2021/07/24.
//

import Foundation
import Alamofire

class ApiNetwork: NSObject {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    
    private var urlSession: URLSession
    
    public var timeInterval: TimeInterval = 30
    
    public static let shared: ApiNetwork = ApiNetwork()
    
    override init() {
        urlSession = URLSession(configuration: .default)
        super.init()
    }
    
    func request(config: NetworkConfiguration, completion: @escaping CompletionHandler) {
        var request = URLRequest(url: config.url)
        
        request.httpMethod = config.method
        request.timeoutInterval = timeInterval
        
        AF.request(request).responseJSON { (response) in
            completion(response.data, response.response, response.error)
        }
        
    }
}
