//
//  ShoeModel.swift
//  WalkInStyle
//
//  Created by K Praveen Kumar on 28/01/24.
//

import Foundation

class Category: Codable {
    let id: Int?
    let name: String?
    var isSelected: Bool = false
}

class Product: Codable {
    var id: Int = 0
    var name: String?
    var brand: String?
    var rating: String?
    var price: String?
    var imageUrl: String?
    var wishlist: Bool = false
}

class ShoeData: Codable {
    let category: [Category]
    let product: [Product]
    
    init(category: [Category], product: [Product]) {
        self.category = category
        self.product = product
    }
}

