//
//  HomeHeadingCell.swift
//  WalkInStyle
//
//  Created by K Praveen Kumar on 28/01/24.
//

import UIKit

class HomeHeadingCell: UICollectionViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "homelogo")
        imageView.contentMode = .scaleAspectFill
        imageView.addShadow(color: UIColor.lightGray, opacity: 0.6, radius: 4, offset: CGSize(width: 3, height: 6))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
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
        imageView.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, paddingTop: -50, paddingLeft: 20, width: 180, height: 180)
    }
    
}
