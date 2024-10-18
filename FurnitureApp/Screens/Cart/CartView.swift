//
//  CartView.swift
//  FurnitureApp
//
//  Created by Engin Gündüz on 10.12.2023.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        ScrollView{
            if (cartManager.furnitures.count > 0) {
                ForEach(cartManager.furnitures, id: \.id){furniture in
                    CategoryItem(furniture: furniture)
                }
                HStack{
                    Text("Your total is")
                    Spacer()
                    Text("$\(cartManager.total).00")
                        .bold()
                }
                .padding()
            }else {
                Text("Your Cart is Empty")
            }
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}
