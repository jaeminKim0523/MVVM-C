//
//  BaseViewController.swift
//  WantedLibrary
//
//  Created by 김재민 on 2021/07/24.
//

import Foundation
import UIKit
import Combine

protocol BaseViewControllerProtocol {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType? { get }
    var cancelStore: Set<AnyCancellable> { get }
}

class BaseViewController<T>: UIViewController, BaseViewControllerProtocol {
    typealias ViewModelType = T
    
    var viewModel: T?
    var cancelStore: Set<AnyCancellable> = Set<AnyCancellable>()
    
    func create(viewModel: T) -> UIViewController? {
        let name: String = String(describing: Self.self)
        let storyboard: UIStoryboard = UIStoryboard(name: name, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: name) as? BaseViewController
        
        vc?.viewModel = viewModel
        
        return vc
    }
}
