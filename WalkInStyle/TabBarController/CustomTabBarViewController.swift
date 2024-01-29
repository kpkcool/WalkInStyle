//
//  CustomTabBarViewController.swift
//  WalkInStyle
//
//  Created by K Praveen Kumar on 28/01/24.
//

import UIKit

class CustomTabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.delegate = self
        self.selectedIndex = 2
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {        
        if let tabBar = tabBar as? TabBarView {
            tabBar.updateCurveForTappedIndex()
        }
    }

}
