//
//  BaseViewModel.swift
//  WantedLibrary
//
//  Created by 김재민 on 2021/07/24.
//

import Foundation


protocol BaseViewModelProtocol {
    associatedtype CoordinatorType
    var coordinator: CoordinatorType? { get }
}

class BaseViewModel<T>: BaseViewModelProtocol {
    typealias CoordinatorType = T
    
    var coordinator: CoordinatorType?
    
    init(viewFlow coordinator: T?) {
        self.coordinator = coordinator
    }
}
