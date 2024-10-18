//
//  FurnitureAppApp.swift
//  FurnitureApp
//
//  Created by Engin Gündüz on 13.11.2023.
//

import SwiftUI

@main
struct FurnitureAppApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData) // environmentObject ile geçiyoruz
        }
    }
}
