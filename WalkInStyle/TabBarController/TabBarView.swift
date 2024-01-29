//
//  TabBarView.swift
//  WalkInStyle
//
//  Created by K Praveen Kumar on 28/01/24.
//

import UIKit

class TabBarView: UITabBar {
    
    private var shapeLayer: CAShapeLayer?
    var centreWidth: CGFloat = 0
    
    override func draw(_ rect: CGRect) {
        centreWidth = self.bounds.width / 2
//        unselectedItemTintColor = .green
    
        tintColor = UIColor(named: "BlueColor")
        addShape()
    }
 
    func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = getPath()
        
        shapeLayer.strokeColor = UIColor(hex: "#F0F0F0").cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 0.5
        shapeLayer.shadowOffset = CGSize(width: 0, height: 0)
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOpacity = 0.2
        
        if let oldShapeLayer = self.shapeLayer {
            let pathAnimation = CABasicAnimation(keyPath: "path")
            pathAnimation.fromValue = oldShapeLayer.path
            pathAnimation.toValue = shapeLayer.path
            pathAnimation.duration = 0.2
            
            shapeLayer.add(pathAnimation, forKey: "pathAnimation")
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        
        self.shapeLayer = shapeLayer
    }

    func getPath() -> CGPath {
        let height: CGFloat = 55
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        
        path.addLine(to: CGPoint(x: centreWidth - height * 2, y: 0 ))
        
        path.addCurve(to: CGPoint(x: centreWidth, y: height),
                      controlPoint1: CGPoint(x: centreWidth - 30, y: 0),
                      controlPoint2: CGPoint(x: centreWidth - 35, y: height))
        
        path.addCurve(to: CGPoint(x: centreWidth + height * 2, y: 0),
                      controlPoint1: CGPoint(x: centreWidth + 35, y: height),
                      controlPoint2: CGPoint(x: centreWidth + 30, y: 0))
        
        path.addLine(to: CGPoint(x: self.bounds.width, y: 0))
        
        
        path.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: CGPoint(x: 0, y: self.bounds.height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        
        path.close()
        return path.cgPath
    }
    
    func updateCurveForTappedIndex() {
        guard let selectedTabView = self.selectedItem?.value(forKey: "view") as? UIView else {return}
        
        self.centreWidth = selectedTabView.frame.origin.x + (selectedTabView.frame.width / 2)
        
        addShape()
    }

}
