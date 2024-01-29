//
//  TopCategoryCollectionCell.swift
//  WalkInStyle
//
//  Created by K Praveen Kumar on 27/01/24.
//

import UIKit

class TopCategoryCollectionCell: UICollectionViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.addCornerRadius(radius: 20)
        view.addShadow(color: UIColor.lightGray, opacity: 0.2, radius: 3, offset: CGSize(width: 6, height: 6))
        view.addBorder(width: 1, color: UIColor(hex: "#fdfdff"))
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Running"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(hex: "#333368")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    override var isSelected: Bool {
//        didSet {
//            updateColors()
//        }
//    }
    
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
        containerView.addSubview(label)
        label.centerInSuperview()
    }
    
    func configure(category: Category) {
        label.text = category.name
        self.isSelected = category.isSelected
        updateColors()
    }
    
    func updateColors() {
        if isSelected {
            containerView.backgroundColor = UIColor(named: "BlueColor")
            label.textColor = .white
            label.font = UIFont.boldSystemFont(ofSize: 14)
        } else {
            containerView.backgroundColor = .white
            label.textColor = UIColor(hex: "#333368")
            label.font = UIFont.systemFont(ofSize: 14)
        }
    }
}
