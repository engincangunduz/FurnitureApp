//
//  ModelData.swift
//  FurnitureApp
//
//  Created by Engin Gündüz on 27.11.2023.
//

import Foundation

@Observable
class ModelData: ObservableObject{
    var furnitures: [Furniture] = load("furniture.json")
    
    var categories: [String: [Furniture]] {
        Dictionary(
            grouping: furnitures,
            by: {
                $0.category.rawValue
            }
        )
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
