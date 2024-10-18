//
//  CategoryPage.swift
//  FurnitureApp
//
//  Created by Engin Gündüz on 5.02.2024.
//
import SwiftUI

struct CategoryPage: View {
    @Environment(ModelData.self) var modelData
    @EnvironmentObject var cartManager: CartManager
    var numberOfProduct: Int
    private let categories = ["All", "Armchair", "Chair", "Sofa", "Table", "TV Unit"]
    @State private var selectedIndex: Int = 0
    var body: some View {
        NavigationView {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        HStack {
                            Image("menu")
                                .padding()
                                .background(Color("Bg"))
                                .cornersRadius(10, corners: .allCorners)
                            Spacer()
                            ZStack(alignment: .topTrailing){
                                NavigationLink {
                                    CartView()
                                } label: {
                                    Image(systemName: "bag.fill")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .foregroundColor(.black)
                                }
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
                        TagLinePage()
                            .padding()
                        SearchAndScanView()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach(0 ..< categories.count) { i in
                                    //if index == 1 then isActive is true
                                    CategoryView(isActive: i == selectedIndex, text: categories[i])
                                        .onTapGesture {
                                            selectedIndex = i
                                        }
                                }
                            }
                            .padding()
                        }
                        
                        ScrollView() {
                            VStack(alignment: .leading) {
                                let selectedCategory = "Armchair"
                                if let itemsForSelectedCategory = modelData.categories[selectedCategory] {
                                    CategoryRow2(categoryName: selectedCategory, items: itemsForSelectedCategory)
                                        .padding(.bottom, 25)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CategoryPage(numberOfProduct: 1)
        .environmentObject(CartManager())
        .environment(ModelData())
}

struct TagLinePage: View {
    var body: some View {
        Text("Find The \nBest")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundStyle(Color("Primary"))
        + Text(" Armchair!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .foregroundStyle(Color("Primary"))
    }
}
