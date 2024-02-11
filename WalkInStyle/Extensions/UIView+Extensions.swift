//
//  UIView+Extensions.swift
//  WalkInStyle
//
//  Created by K Praveen Kumar on 27/01/24.
//

import UIKit

extension UIView {
    func addBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    func addCornerRadius(radius: CGFloat) {
        layer.cornerRadius = radius
//        layer.masksToBounds = true
    }
    
    func addCornerRadiusToSide(_ radius: CGFloat, onCorners corners: UIRectCorner) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        layer.mask = maskLayer
        
        // Add padding to the text to prevent it from being clipped
        if let button = self as? UIButton {
            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: radius, bottom: 0, right: radius)
        }
    }
    
    func addShadow(color: UIColor, opacity: Float, radius: CGFloat, offset: CGSize) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
    }
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                leading: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                trailing: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
//    func centerInSuperview(size: CGSize = .zero) {
//        guard let superview = superview else { return }
//        
//        translatesAutoresizingMaskIntoConstraints = false
//        
//        centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
//        centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
//        
//        widthAnchor.constraint(equalToConstant: size.width).isActive = true
//        heightAnchor.constraint(equalToConstant: size.height).isActive = true
//    }
    
    func centerInSuperview(size: CGSize = .zero) {
            guard let superview = superview else { return }
            
            translatesAutoresizingMaskIntoConstraints = false
            
            centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
            centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
            
            if size.width > 0 {
                widthAnchor.constraint(equalToConstant: size.width).isActive = true
            }
            
            if size.height > 0 {
                heightAnchor.constraint(equalToConstant: size.height).isActive = true
            }
        }
    
    func fillSuperView() {
            guard let superview = superview else {
                return // Needs a superview to fill
            }
            
            translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: superview.topAnchor),
                leadingAnchor.constraint(equalTo: superview.leadingAnchor),
                trailingAnchor.constraint(equalTo: superview.trailingAnchor),
                bottomAnchor.constraint(equalTo: superview.bottomAnchor)
            ])
        }
}

