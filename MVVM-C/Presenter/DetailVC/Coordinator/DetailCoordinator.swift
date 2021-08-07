//
//  DetailCoordinator.swift
//  WantedLibrary
//
//  Created by 김재민 on 2021/07/24.
//

import Foundation

class DetailCoordinator: BaseCoordinator {
    
    func popDetailViewController() {
        self.navigationController.popViewController(animated: true)
    }
    
}
