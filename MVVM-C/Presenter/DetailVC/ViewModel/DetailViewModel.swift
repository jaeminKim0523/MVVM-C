//
//  DetailViewModel.swift
//  WantedLibrary
//
//  Created by 김재민 on 2021/07/24.
//

import Foundation

class DetailViewModel: BaseViewModel<DetailCoordinator> {
    
    let volumeInfoModel: VolumeInfoModel
    
    init(viewFlow coordinator: DetailCoordinator, volumeInfo model: VolumeInfoModel) {
        self.volumeInfoModel = model
        super.init(viewFlow: coordinator)
    }
    
    func displayPreviewLink() {
        appDelegate.appCoordinator?.displayWebBrowser(url: volumeInfoModel.previewLink)
    }
    
    func displayInformationLink() {
        appDelegate.appCoordinator?.displayWebBrowser(url: volumeInfoModel.infoLink)
    }
    
}
