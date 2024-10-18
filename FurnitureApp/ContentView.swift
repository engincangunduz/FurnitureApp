//
//  ContentView.swift
//  FurnitureApp
//
//  Created by Engin Gündüz on 13.11.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HomeScreen(numberOfProduct: 1)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ModelData())
}

