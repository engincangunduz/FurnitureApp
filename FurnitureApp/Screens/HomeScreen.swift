//
//  HomeScreen.swift
//  FurnitureApp
//
//  Created by Engin Gündüz on 16.11.2023.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var modelData: ModelData // EnvironmentObject kullanılıyor
    @EnvironmentObject var cartManager: CartManager
    @State private var selectedIndex: Int = 0
    @State private var showMenu = false
    public var numberOfProduct: Int
    private let categories = ["All", "Armchair", "Chair", "Sofa", "Table", "TV Unit"]
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)

                ScrollView {
                    VStack(alignment: .leading){
                        HStack{
                            Button {
                                showMenu.toggle()
                            } label: {
                                Image("menu")
                                    .padding()
                                    .background(Color("Bg"))
                                    .cornersRadius(10, corners: .allCorners)
                            }

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
                        TagLineView()
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
                            .padding(.top)
                        }
                        VStack(alignment: .leading) {
                            ForEach(modelData.categories.keys.sorted(), id: \.self) {key in
                                CategoryRow(categoryName: key, items: modelData.categories[key]!)
                            }
                            .padding(.bottom, 15)
                        }
                    }
                }
                //Custom Bottom NavBar
                HStack{
                    BottomNavBarItem(image: Image("Home")) {}
                    BottomNavBarItem(image: Image("fav")) {}
                    BottomNavBarItem(image: Image("shop")) {}
                    BottomNavBarItem(image: Image("User")) {}
                }
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .padding(.horizontal)
                .shadow(color: Color.black.opacity(0.15),radius: 0, x:2, y:6)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
}

#Preview {
    HomeScreen(numberOfProduct: 1)
        .environmentObject(ModelData())
        .environmentObject(CartManager())
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundStyle(Color("Primary"))
        + Text(" Furniture!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .foregroundStyle(Color("Primary"))
    }
}

struct SearchAndScanView: View {
    @State private var search: String = ""
    var body: some View {
        HStack{
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Function", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing)
            
            Button(action: {}) {
                Image("Scan")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    @State var isShowView2: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Button {
                isShowView2.toggle()
            } label: {
                Text(text)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .foregroundStyle(isActive ? Color("Primary"): Color.black.opacity(0.4))
            }
            .fullScreenCover(isPresented: $isShowView2, content: {
                CategoryPageGo(isShowView2: $isShowView2)
            })
//            Text(text)
//                .font(.system(size: 18))
//                .fontWeight(.medium)
//                .foregroundStyle(isActive ? Color("Primary"): Color.black.opacity(0.4))
//            
//            if (isActive) {
//                Color("Primary")
//                    .frame(width: 18, height: 2)
//                    .clipShape(.capsule)
//            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    let image: Image
    //let size: CGFloat
    var body: some View {
        VStack{
            image
                .resizable()
                .frame(width: 175, height: 175)
                .cornerRadius(20.0)
            Text("Luxury Swedian Chair")
                .font(.headline)
                .fontWeight(.bold)
            HStack(spacing: 2){
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Spacer()
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: 200)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
    }
}

struct BottomNavBarItem: View {
    let image: Image
    let action: ()-> Void
    var body: some View {
        Button(action: action) {
            image
                .frame(maxWidth: .infinity)
        }
    }
}

struct CategoryPageGo: View {
    @Binding var isShowView2: Bool
    var body: some View {
        CategoryPage(numberOfProduct: 1)
    }
}
