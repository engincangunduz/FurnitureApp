//
//  CategoryItem.swift
//  FurnitureApp
//
//  Created by Engin Gündüz on 27.11.2023.
//

import SwiftUI

struct CategoryItem2: View {
    var furniture: Furniture
    var body: some View {
        VStack(alignment: .leading) {
            furniture.image
                .resizable()
                .frame(width: 130, height: 130)
                .cornerRadius(20.0)
                .padding(.top)
            Text(furniture.name)
                .font(.headline)
                .fontWeight(.bold)
            HStack(spacing: 2){
//                ForEach(0 ..< furniture.numStar) { item in
//                    Image("star")
//                }
                Button(action: {
                    
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(Color("Primary"))
                        .frame(width: 20, height: 20)
                })
                Spacer()
                Text("$\(furniture.price)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
            }
        }
        .frame(width: 150)
        .padding(.leading, 25)
        .background(Color.white)
        .cornerRadius(20.0)
    }
}

#Preview {
    CategoryItem2(furniture: ModelData().furnitures[0])
}
