//
//  ViewController.swift
//  WantedLibrary
//
//  Created by 김재민 on 2021/07/24.
//

import Kingfisher
import UIKit

class SearchViewController: BaseViewController<SearchViewModel> {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
        fetchSearchBook()
        loadingIndicator.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func configTableView() {
        let searchCell = UINib(nibName: "SearchTableViewCell", bundle: nil)
        tableView.register(searchCell, forCellReuseIdentifier: "SearchTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func fetchSearchBook() {
        viewModel?.searchSubject.sink(receiveValue: { [weak self] _ in
            self?.tableView.reloadData()
        }).store(in: &cancelStore)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel?.searchBook(search: searchBar.text ?? "")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            tableView.reloadData()
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowCount = viewModel?.searchModels.count ?? 0
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        let selectedView = UIView()
        selectedView.backgroundColor = .clear
        cell.selectedBackgroundView = selectedView
        
        cell.labelTitle.text = viewModel?.searchModels[indexPath.row].title
        cell.labelSubtitle.text = viewModel?.searchModels[indexPath.row].subtitle
        cell.labelPublisher.text = viewModel?.searchModels[indexPath.row].publisher
        cell.thumbImageView.kf.setImage(with: viewModel?.searchModels[indexPath.row].thumbnailUrl)
        
        return cell
    }
}
