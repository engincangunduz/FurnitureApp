//
//  CartManager.swift
//  FurnitureApp
//
//  Created by Engin Gündüz on 12.12.2023.
//

import Foundation

class CartManager: ObservableObject{
    @Published private(set) var furnitures: [Furniture] = []
    @Published private(set) var total: Int = 0
    
    func addToCart(furniture: Furniture){
        furnitures.append(furniture)
        total += furniture.price
    }
}
