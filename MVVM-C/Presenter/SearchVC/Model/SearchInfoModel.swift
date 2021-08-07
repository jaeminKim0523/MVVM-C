//
//  SearchInfoModel.swift
//  WantedLibrary
//
//  Created by 김재민 on 2021/08/07.
//

import Foundation

struct SearchInfoModel {
    
    enum TermType: String {
        case intitle = "intitle"
        case inauthor = "inauthor"
        case inpublisher = "inpublisher"
    }
    
    let searchURL: String = "https://www.googleapis.com/books/v1/volumes?"
    
    let keyword: String
    let type: TermType
    
}
