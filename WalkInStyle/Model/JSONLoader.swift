//
//  JSONLoader.swift
//  WalkInStyle
//
//  Created by K Praveen Kumar on 28/01/24.
//

import Foundation

class JSONLoader {
    
    static func getShoeData() -> ShoeData? {
        
        guard let path = Bundle.main.path(forResource: "shoeData", ofType: "json") else {
            fatalError("Couldn't find 'shoe.json' in the main bundle.")
        }

        let url = URL(fileURLWithPath: path)

        do {
            let jsonData = try Data(contentsOf: url)
            let shoeData = try JSONDecoder().decode(ShoeData.self, from: jsonData)
            return shoeData
        } catch {
            print("Error loading or decoding JSON: \(error)")
        }
        return nil
    }
}
