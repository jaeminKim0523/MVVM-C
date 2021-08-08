//
//  VolumeModel.swift
//  WantedLibrary
//
//  Created by 김재민 on 2021/07/24.
//

import Foundation

struct VolumeModel {
    var totalItems: Int = 0
    var kind: String = ""
    var items: [VolumeItemModel] = []
    
    init(dictionary: [String : Any]) {
        self.totalItems = dictionary["totalItems"] as? Int ?? 0
        self.kind = dictionary["kind"] as? String ?? ""
        
        var tempVolumeItemModels: [VolumeItemModel] = []
        if let volumeItems = dictionary["items"] as? [[String : Any]] {
            for volumeItem in volumeItems {
                tempVolumeItemModels.append(VolumeItemModel(dictionary: volumeItem))
            }
        }
        self.items = tempVolumeItemModels
    }
}
