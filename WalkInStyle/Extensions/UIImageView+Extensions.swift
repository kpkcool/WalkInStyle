//
//  UIImageView+Extensions.swift
//  WalkInStyle
//
//  Created by K Praveen Kumar on 31/01/24.
//

import UIKit

extension UIImageView {
    func loadImage(from urlString: String?, placeholder: UIImage? = nil) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            self.image = placeholder
            return
        }

        self.sd_setImage(with: url, placeholderImage: placeholder)
    }
}
