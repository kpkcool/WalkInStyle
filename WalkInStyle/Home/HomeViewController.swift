//
//  ViewController.swift
//  WalkInStyle
//
//  Created by K Praveen Kumar on 27/01/24.
//

import UIKit

enum HomeItems: Int, CaseIterable {
    case heading = 0
    case search
    case category
    case items
}

class HomeViewController: UIViewController {
    
    private lazy var homeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HomeHeadingCell.self, forCellWithReuseIdentifier: "HomeHeadingCell")
        collectionView.register(HomeSearchCell.self, forCellWithReuseIdentifier: "HomeSearchCell")
        collectionView.register(HomeCategoryCell.self, forCellWithReuseIdentifier: "HomeCategoryCell")
        collectionView.register(HomeProductCell.self, forCellWithReuseIdentifier: "HomeProductCell")
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var shoeData = ShoeData(category: [], product: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        shoeData = JSONLoader.getShoeData() ?? ShoeData(category: [], product: [])
    }
    
    private func setupUI() {
        view.addSubview(homeCollectionView)
        homeCollectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
    }
}

//MARK: - COllectionView Methods
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let homeCell = HomeItems(rawValue: indexPath.row) else { return UICollectionViewCell() }
        
        switch homeCell {
        case .heading:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeHeadingCell", for: indexPath) as? HomeHeadingCell else { return UICollectionViewCell() }
            return cell
        case .search:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeSearchCell", for: indexPath) as? HomeSearchCell else { return UICollectionViewCell() }
            // cell.configure(name: shoeData.category[indexPath.item].name)
            return cell
        case .category:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCategoryCell", for: indexPath) as? HomeCategoryCell else { return UICollectionViewCell() }
            cell.configure(data: shoeData.category)
            return cell
        case .items:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeProductCell", for: indexPath) as? HomeProductCell else { return UICollectionViewCell() }
            cell.configure(data: shoeData)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let homeCell = HomeItems(rawValue: indexPath.row) else { return .zero }
        
        switch homeCell {
        case .heading:
            return CGSize(width: UIScreen.main.bounds.width, height: CGFloat(65))
        case .search:
            return CGSize(width: UIScreen.main.bounds.width, height: CGFloat(70))
        case .category:
            return CGSize(width: UIScreen.main.bounds.width, height: CGFloat(60))
        case .items:
            let cellHeight: CGFloat = 10 * 200
            let cellPadding: CGFloat = 9 * 10 + 20
            return CGSize(width: UIScreen.main.bounds.width, height: cellHeight + cellPadding)
        }
    }
    
}
