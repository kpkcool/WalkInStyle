//
//  itemCollectionViewCell.swift
//  WalkInStyle
//
//  Created by K Praveen Kumar on 27/01/24.
//

import UIKit
import SDWebImage

class ItemCollectionViewCell: UICollectionViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.addCornerRadius(radius: 12)
        view.addShadow(color: UIColor.lightGray, opacity: 0.2, radius: 4, offset: CGSize(width: 2, height: 4))
        // view.addBorder(width: 1, color: UIColor(hex: "#fdfdff"))
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var productName: UILabel = {
        let label = UILabel()
        // label.font = UIFont(name: "SanFrancisco", size: 14)
        // label.font = UIFont(name: "Montserrat-Regular", size: 14)
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = UIColor(hex: "#333368")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var productPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(hex: "#333368")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var wishlistImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "not_wishlist")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var ratingImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(hex: "#333368")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blueShoe")
        imageView.contentMode = .scaleAspectFit
        imageView.addShadow(color: UIColor.lightGray, opacity: 0.9, radius: 10, offset: CGSize(width: 12, height: 12))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override var isSelected: Bool {
        didSet {
            updateColors()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(containerView)
        containerView.fillSuperView()
        
        containerView.addSubview(imageView)
        imageView.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, trailing: containerView.trailingAnchor, height: 160)
        imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        containerView.addSubview(wishlistImage)
        wishlistImage.anchor(top: containerView.topAnchor, trailing: containerView.trailingAnchor, paddingTop: 12, paddingRight: 12, width: 20, height: 20)
        
        
        containerView.addSubview(productName)
        productName.anchor(top: imageView.bottomAnchor, leading: containerView.leadingAnchor, trailing: containerView.trailingAnchor, paddingTop: -18, paddingLeft: 8, paddingRight: 8)
        
        containerView.addSubview(productPrice)
        productPrice.anchor(top: productName.bottomAnchor, trailing: containerView.trailingAnchor, paddingTop: 8, paddingRight: 16)
        
        containerView.addSubview(ratingLabel)
        ratingLabel.anchor(top: productName.bottomAnchor, leading: containerView.leadingAnchor, paddingTop: 10, paddingLeft: 24)
        
        containerView.addSubview(ratingImage)
        ratingImage.anchor(trailing: ratingLabel.leadingAnchor, paddingRight: 4, width: 14, height: 14)
        ratingImage.centerYAnchor.constraint(equalTo: ratingLabel.centerYAnchor).isActive = true
    }
    
    func configure(data: Product) {
        productName.text = data.name
        productPrice.text = data.price
        ratingLabel.text = data.rating
        if let imageUrl = data.imageUrl, !imageUrl.isEmpty {
            imageView.loadImage(from: imageUrl)
        } else {
            imageView.image = UIImage(named: "\(data.id)")
        }
    }
    
    private func updateColors() {
        if isSelected {
            containerView.backgroundColor = UIColor(hex: "#f0f4ff")
        } else {
            containerView.backgroundColor = .white
        }
    }
}

