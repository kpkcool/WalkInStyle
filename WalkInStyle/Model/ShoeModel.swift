//
//  ShoeModel.swift
//  WalkInStyle
//
//  Created by K Praveen Kumar on 28/01/24.
//

import Foundation

struct Category: Codable {
    let id: Int
    let name: String
    var isSelected: Bool
}

struct Product: Codable {
    let id: Int
    let name: String
    let brand: String
    let rating: String
    let price: String
    let imageUrl: String?
    var wishlist: Bool
}

struct ShoeData: Codable {
    let category: [Category]
    let product: [Product]
}

