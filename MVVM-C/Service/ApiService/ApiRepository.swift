//
//  ApiService.swift
//  WantedLibrary
//
//  Created by 김재민 on 2021/07/24.
//

import Foundation

class ApiRepository {
    typealias CompletionHandler = (VolumeModel) -> Void
    
    let apiKey: String = "AIzaSyC1B1cigRTivVEdP2BdjqRvLbbAoc6ZvI8"
    
    func loadSearchResult(model: SearchInfoModel, completion: @escaping CompletionHandler) {
        
        var components = URLComponents(string: model.searchURL)
        let searchItem = URLQueryItem(name: "q", value: "\(model.keyword)+\(model.type.rawValue)")
        let keyItem = URLQueryItem(name: "key", value: apiKey)
        components?.queryItems = [searchItem, keyItem]
        
        guard let url = components?.url else { return }
        
        let config = NetworkConfiguration(url: url, method: .get)
        ApiNetwork.shared.request(config: config) { (data, response, error) in
            
            guard let resultData = data else { return }
            guard let resultJson = try? JSONSerialization.jsonObject(with: resultData, options: .mutableContainers) as? [String : Any] else {
                return
            }

            let volumeModel: VolumeModel = VolumeModel(dictionary: resultJson)

            completion(volumeModel)
        }
    }
    
}
