//
//  DetailsImage.swift
//  FurnitureApp
//
//  Created by Engin Gündüz on 2.12.2023.
//

import SwiftUI

struct DetailsImage: View {
    var image: Image
    var body: some View {
        image
            .resizable()
            .aspectRatio(1,contentMode: .fit)
            .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    DetailsImage(image: Image("armchair_1"))
}
