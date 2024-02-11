//
//  WishlistCell.swift
//  WalkInStyle
//
//  Created by K Praveen Kumar on 31/01/24.
//

import UIKit

class WishlistCell: UICollectionViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.addCornerRadius(radius: 12)
        view.addShadow(color: UIColor.lightGray, opacity: 0.2, radius: 4, offset: CGSize(width: 2, height: 4))
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var productName: UILabel = {
        let label = UILabel()
        label.text = "Nike Air Max"
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.textColor = UIColor(hex: "#333368")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var closeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "close")
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(crossTapped))
        imageView.addGestureRecognizer(tapGesture)
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
        label.text = "4.7"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor(hex: "#333368")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ratingView: UIView = {
        let view = UIView()
//        view.addCornerRadius(radius: 12)
//        view.addShadow(color: UIColor.lightGray, opacity: 0.2, radius: 4, offset: CGSize(width: 2, height: 4))
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "1")
        imageView.contentMode = .scaleAspectFit
        imageView.addShadow(color: UIColor.lightGray, opacity: 0.9, radius: 10, offset: CGSize(width: 12, height: 12))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var moveToCartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Move To Cart", for: .normal)
        button.backgroundColor = UIColor(hex: "#e6e6fa", alpha: 1)
        button.addShadow(color: UIColor.lightGray, opacity: 0.2, radius: 4, offset: CGSize(width: 2, height: 4))
        // button.addCornerRadiusToSide(12, onCorners: [.bottomRight, .bottomLeft])
        button.setTitleColor(UIColor(named: "BlueColor"), for: .normal)
        
        button.addTarget(self, action: #selector(moveToCartPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false // Enable Auto Layout
        return button
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
        
        containerView.addSubview(closeImage)
        closeImage.anchor(top: containerView.topAnchor, trailing: containerView.trailingAnchor, paddingTop: 16, paddingRight: 16, width: 12, height: 12)
        
        containerView.addSubview(productName)
        productName.anchor(top: imageView.bottomAnchor, leading: containerView.leadingAnchor, paddingTop: -18, paddingLeft: 8)
        
        containerView.addSubview(ratingView)
        ratingView.anchor(leading: productName.trailingAnchor, trailing: containerView.trailingAnchor, paddingLeft: 8, paddingRight: 8)
        ratingView.centerYAnchor.constraint(equalTo: productName.centerYAnchor).isActive = true
        
        ratingView.addSubview(ratingImage)
        ratingView.addSubview(ratingLabel)
        
        ratingImage.anchor(leading: ratingView.leadingAnchor, paddingLeft: 4, width: 14, height: 14)
        ratingImage.centerYAnchor.constraint(equalTo: ratingView.centerYAnchor).isActive = true
        ratingLabel.anchor(leading: ratingImage.trailingAnchor, trailing: ratingView.trailingAnchor, paddingLeft: 10)
        ratingLabel.centerYAnchor.constraint(equalTo: ratingView.centerYAnchor).isActive = true
        
        containerView.addSubview(moveToCartButton)
        moveToCartButton.anchor(leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, height: 32)
    }
    
    func configure(data: Product) {
        productName.text = data.name
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
    
    @objc func crossTapped() {
        print("cross tapped")
    }
    
    @objc func moveToCartPressed() {
        print("moveToCart tapped")
    }
}
