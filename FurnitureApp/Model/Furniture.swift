//
//  Furniture.swift
//  FurnitureApp
//
//  Created by Engin Gündüz on 18.11.2023.
//

import Foundation
import SwiftUI

struct Furniture: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var price: Int
    var numStar: Int
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case chair = "Armchair"
        case bench = "Chair"
        case sofa = "Sofa"
    }
    var dimensions: Dimensions
    struct Dimensions: Hashable, Codable{
        var height: Int
        var width: Int
    }
    
    var colors: Colors
    struct Colors: Hashable, Codable {
        var color1: String
        var color2: String
        var color3: String
    }
}
