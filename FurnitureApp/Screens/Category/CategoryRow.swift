//
//  CategoryRow.swift
//  FurnitureApp
//
//  Created by Engin Gündüz on 27.11.2023.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Furniture]
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
//                .font(.system(size: 24))
//                .fontWeight(.bold)
                .font(.custom("PlayfairDisplay-Bold", size: 24))
                //.padding(.leading, 15)
                .padding(.horizontal)
                .padding(.top, 30)
                .padding(.bottom, 45)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 10){
                    ForEach(items) { furniture in
                        NavigationLink {
                            DetailScreen(furniture: furniture)
                        } label: {
                            CategoryItem(furniture: furniture)
                        }.foregroundColor(.black)
                    }
                    .padding(.trailing)
                }
                .padding(.leading)
            }
            .frame(height: 210)
        }
    }
}

#Preview {
    let furnitures = ModelData().furnitures
    return CategoryRow(
        categoryName: furnitures[0].category.rawValue,
        items: Array(furnitures.prefix(6))
    )
}
