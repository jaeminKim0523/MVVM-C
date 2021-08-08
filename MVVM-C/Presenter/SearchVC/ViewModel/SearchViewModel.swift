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
    
    let searchSubject: PassthroughSubject = PassthroughSubject<[SearchResultModel], Never>()
    
    let service = SearchService()
    
    func searchBook(search keyword: String) {
        service.searchBook(search: keyword) { [weak self] (searchModels) in
            self?.searchModels = searchModels
            self?.searchSubject.send(searchModels)
        }
    }
    
    func displayDetailViewController(volumeInfo model: VolumeInfoModel) {
        coordinator?.displayDetailViewController(volumeInfo: model)
    }
    
}
