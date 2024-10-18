//
//  CategoryRow.swift
//  FurnitureApp
//
//  Created by Engin Gündüz on 27.11.2023.
//
import SwiftUI

struct CategoryRow2: View {
    var categoryName: String
    var items: [Furniture]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.custom("PlayfairDisplay-Bold", size: 24))
                .padding(.horizontal)
                .padding(.top, 30)
            //bir satırda iki tane öğe olmasını sağlamak için
            LazyVGrid(columns: columns, spacing: 10){
                ForEach(items) { furniture in
                    NavigationLink {
                        DetailScreen(furniture: furniture)
                    } label: {
                        CategoryItem2(furniture: furniture)
                    }.foregroundColor(.black)
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    let furnitures = ModelData().furnitures
    return CategoryRow2(
        categoryName: furnitures[0].category.rawValue,
        items: Array(furnitures.prefix(2))
    )
}
