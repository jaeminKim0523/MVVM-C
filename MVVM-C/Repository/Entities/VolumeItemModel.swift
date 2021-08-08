//
//  VolumeModel.swift
//  WantedLibrary
//
//  Created by 김재민 on 2021/07/24.
//

import Foundation

struct VolumeItemModel {
    
    let id: String
    let etag: String
    let kind: String
    let selfLink: String
    let volumeInfoModel: VolumeInfoModel
    
    init(dictionary: [String : Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.etag = dictionary["etag"] as? String ?? ""
        self.kind = dictionary["kind"] as? String ?? ""
        self.selfLink = dictionary["selfLink"] as? String ?? ""
        
        let volumeInfo = dictionary["volumeInfo"] as? [String : Any] ?? [:]
        self.volumeInfoModel = VolumeInfoModel(dictionary: volumeInfo)
        
    }
    
}
