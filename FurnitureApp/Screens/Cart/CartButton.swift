//
//  CartButton.swift
//  FurnitureApp
//
//  Created by Engin Gündüz on 10.12.2023.
//
import SwiftUI

struct CartButton: View {
    var numberOfProduct: Int
    var body: some View {
        NavigationView {
            HStack{
                Image("menu")
                    .padding()
                    .background(Color("Bg"))
                    .cornersRadius(10, corners: .allCorners)
                Spacer()
                ZStack(alignment: .topTrailing){
                    
                    Image(systemName: "bag.fill")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.black)
                    if numberOfProduct > 0 {
                        Text("\(numberOfProduct)")
                            .font(.caption2)
                            .foregroundStyle(.white)
                            .frame(width: 18, height: 18)
                            .background(Color("Primary"))
                            .cornersRadius(50, corners: .allCorners)
                    }
                }.padding(.trailing)
            }
        }
    }
}

#Preview {
    CartButton(numberOfProduct: 1)
}
