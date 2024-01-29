//
//  SearchCell.swift
//  WalkInStyle
//
//  Created by K Praveen Kumar on 28/01/24.
//

import UIKit

class HomeSearchCell: UICollectionViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        // view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        // searchBar.backgroundColor = .green
        searchBar.placeholder = "Search"
        searchBar.layer.borderColor = UIColor.white.cgColor
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        searchBar.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(containerView)
        containerView.fillSuperView()
        containerView.addSubview(searchBar)
        searchBar.anchor(leading: containerView.leadingAnchor, trailing: containerView.trailingAnchor, height: 60)
        searchBar.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
    }
    
}

extension HomeSearchCell: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            print("Search text: \(searchText)")
        }
        
        // Dismiss the keyboard
        searchBar.resignFirstResponder()
    }
}
