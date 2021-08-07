//
//  VolumeInfoModel.swift
//  WantedLibrary
//
//  Created by 김재민 on 2021/07/24.
//

import Foundation

class VolumeInfoModel {
    let pageCount: Int
    
    let publisher: String
    let title: String
    let language: String
    let infoLink: String
    let thumbnailUrl: String
    let printType: String
    let subtitle: String
    let contentVersion: String
    let publishedDate: String
    let previewLink: String
    let canonicalVolumeLink: String
    let description: String
    
    init(dictionary: [String : Any]) {
        self.pageCount = dictionary["pageCount"] as? Int ?? 0
        
        self.publisher = dictionary["publisher"] as? String ?? ""
        self.title = dictionary["title"] as? String ?? ""
        self.language = dictionary["language"] as? String ?? ""
        self.infoLink = dictionary["infoLink"] as? String ?? ""
        let imageLinks = dictionary["imageLinks"] as? [String : Any]
        self.thumbnailUrl = imageLinks?["thumbnail"] as? String ?? ""
        self.printType = dictionary["printType"] as? String ?? ""
        self.subtitle = dictionary["subtitle"] as? String ?? ""
        self.contentVersion = dictionary["contentVersion"] as? String ?? ""
        self.publishedDate = dictionary["publishedDate"] as? String ?? ""
        self.previewLink = dictionary["previewLink"] as? String ?? ""
        self.canonicalVolumeLink = dictionary["canonicalVolumeLink"] as? String ?? ""
        self.description = dictionary["description"] as? String ?? ""
    }
}
