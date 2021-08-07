//
//  SearchViewModel.swift
//  WantedLibrary
//
//  Created by 김재민 on 2021/07/24.
//

import Foundation
import Combine

class SearchViewModel: BaseViewModel<SearchCoordinator> {
    
    var searchModels: [SearchResultModel] = []
    
    let repository: ApiRepository = ApiRepository()
    let searchSubject: PassthroughSubject = PassthroughSubject<[SearchResultModel], Never>()
    
    func searchBook(search keyword: String) {
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
            self?.searchSubject.send(searchModels)
        }
    }
    
    func displayDetailViewController(volumeInfo model: VolumeInfoModel) {
        coordinator?.displayDetailViewController(volumeInfo: model)
    }
    
}
