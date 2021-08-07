//
//  DetailViewController.swift
//  WantedLibrary
//
//  Created by 김재민 on 2021/07/24.
//

import Foundation
import Kingfisher
import UIKit

class DetailViewController: BaseViewController<DetailViewModel> {
    
    @IBOutlet weak var imageViewThumbnail: UIImageView!
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    @IBOutlet weak var labelPublisher: UILabel!
    @IBOutlet weak var labelPublishedDate: UILabel!
    @IBOutlet weak var labelLanguage: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func viewDidLoad() {
        configUI()
    }
    
    func configUI() {
        let urlString = viewModel?.volumeInfoModel.thumbnailUrl ?? ""
        let url = URL(string: urlString)
        imageViewThumbnail.kf.setImage(with: url)
        
        labelTitle.text = viewModel?.volumeInfoModel.title
        labelSubtitle.text = viewModel?.volumeInfoModel.subtitle
        labelPublisher.text = viewModel?.volumeInfoModel.publisher
        labelPublishedDate.text = viewModel?.volumeInfoModel.publishedDate
        labelLanguage.text = viewModel?.volumeInfoModel.language
        labelDescription.text = viewModel?.volumeInfoModel.description
    }
    
    @IBAction func tappedPreviewLinkButton(_ sender: Any) {
        viewModel?.displayPreviewLink()
    }
    
    @IBAction func tappedInfoLinkButton(_ sender: Any) {
        viewModel?.displayInformationLink()
    }
    
}
