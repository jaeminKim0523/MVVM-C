//
//  AppCoordinator.swift
//  WantedLibrary
//
//  Created by 김재민 on 2021/07/24.
//

import Foundation
import UIKit

class AppCoordinator: BaseCoordinator {
    
    func startSearchViewController() {
        let searchCoordinator: SearchCoordinator = SearchCoordinator(navigationController: navigationController)
        let searchViewModel: SearchViewModel = SearchViewModel(viewFlow: searchCoordinator)
        guard let searchVC = SearchViewController().create(viewModel: searchViewModel) else {
            return
        }
        
        navigationController.setViewControllers([searchVC], animated: true)
        navigationController.navigationBar.topItem?.title = "Wanted Library"
    }
    
    func displayWebBrowser(url: String) {
        if let webUrl = URL(string: url) {
            UIApplication.shared.open(webUrl, options: [:], completionHandler: nil)
        }
    }
    
}
