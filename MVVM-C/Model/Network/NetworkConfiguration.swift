//
//  NetworkConfiguration.swift
//  FinUp.WiseInvest.Ios
//
//  Created by 김재민 on 2021/07/07.
//

import Foundation

struct NetworkConfiguration {
    
    enum method: String {
        case get = "get"
        case post = "post"
    }
    
    let url: URL
    let method: String
    
    internal init(url: URL, method: method) {
        self.url = url
        self.method = method.rawValue
    }
}

