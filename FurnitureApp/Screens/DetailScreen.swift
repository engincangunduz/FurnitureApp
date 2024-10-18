//
//  DetailsScreen2.swift
//  FurnitureApp
//
//  Created by Engin Gündüz on 2.12.2023.
//
import SwiftUI

struct DetailScreen: View {
    @Environment(ModelData.self) var modelData
    var furniture: Furniture
    var body: some View {
        ZStack {
            Color("Bg")
            ScrollView {
                DetailsImage(image: furniture.image)
                
                DescriptionsViews(furniture: furniture)
            }
            .edgesIgnoringSafeArea(.top)
            HStack {
                Text("$\(furniture.price)")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                
                Text("Add to Cart")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Primary"))
                    .padding()
                    .padding(.horizontal, 8)
                    .background(Color.white)
                    .cornerRadius(10.0)
                
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .cornersRadius(60.0, corners: .topLeft)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    let modelData = ModelData()
    return DetailScreen(furniture: ModelData().furnitures[0])
        .environment(modelData)
}
