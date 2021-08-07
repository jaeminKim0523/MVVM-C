//
//  SearchCoordinator.swift
//  WantedLibrary
//
//  Created by 김재민 on 2021/07/24.
//

import Foundation

class SearchCoordinator: BaseCoordinator {
    
    func displayDetailViewController(volumeInfo model: VolumeInfoModel) {
        
        let detailCoordinator: DetailCoordinator = DetailCoordinator(navigationController: navigationController)
        let detailViewModel: DetailViewModel = DetailViewModel(viewFlow: detailCoordinator, volumeInfo: model)
        let detailViewController: DetailViewController = DetailViewController().create(viewModel: detailViewModel) as! DetailViewController
        
        navigationController.pushViewController(detailViewController, animated: true)
        
    }
    
}
