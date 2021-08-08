//
//  SearchService.swift
//  MVVM-C
//
//  Created by 김재민 on 2021/08/08.
//

import Foundation

class SearchService {
    typealias completion = ([SearchResultModel]) -> ()
    
    let repository: ApiRepository = ApiRepository()
    
    var searchModels: [SearchResultModel] = []
    
    func searchBook(search keyword: String, completion: @escaping completion) {
        let searchModel = SearchInfoModel(keyword: keyword, type: .intitle)
        repository.loadSearchResult(model: searchModel) { [weak self] model in
            
            var searchModels: [SearchResultModel] = []
            
            for m in  model.items {
                guard let url = URL(string: m.volumeInfoModel.thumbnailUrl) else {
                    continue
                }
                let searchModel: SearchResultModel = SearchResultModel(title: m.volumeInfoModel.title, subtitle: m.volumeInfoModel.subtitle, publisher: m.volumeInfoModel.publisher, thumbnailUrl: url)
                searchModels.append(searchModel)
            }
            
            self?.searchModels = searchModels
            completion(searchModels)
        }
    }
}
