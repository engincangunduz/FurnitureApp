//
//  DescriptionsViews.swift
//  FurnitureApp
//
//  Created by Engin Gündüz on 2.12.2023.
//

import SwiftUI

struct DescriptionsViews: View {
    var furniture: Furniture
    @State var count: Int = 0
    var body: some View {
        VStack (alignment: .leading) {
            //Title
            Text(furniture.name)
                .font(.title)
                .fontWeight(.bold)
            //Rating
            HStack (spacing: 4) {
                ForEach(0 ..< furniture.numStar) { item in
                    Image("star")
                }
                Spacer()
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text(furniture.description)
                .lineSpacing(8.0)
                .opacity(0.6)
        
            //Info
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    Text("Dimensions")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Text("Height: \(furniture.dimensions.height) cm")
                        .opacity(0.6)
                    Text("Width: \(furniture.dimensions.width) cm")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack (alignment: .leading) {
                    Text("Treatment")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Text("Jati Wood, Canvas, \nAmazing Love")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            
            //Colors and Counter
            HStack {
                VStack (alignment: .leading) {
                    Text("Colors")
                        .fontWeight(.semibold)
                    HStack {
                        Button(action: {
                            //renk seçimi
                        }) {
                            ColorDotViews(color: Color(furniture.colors.color1))
                        }
                        Button(action: {
                            
                        }) {
                            ColorDotViews(color: Color(furniture.colors.color2))
                        }
                        Button(action: {
                            
                        }) {
                            ColorDotViews(color: Color(furniture.colors.color3))
                        }
                        //ColorDotViews(color: Color(#colorLiteral(red: 0.1803921569, green: 0.6352941176, blue: 0.6705882353, alpha: 1)))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    //Minus Button
                    Button(action: {
                        self.count -= 1
                    }) {
                        Image(systemName: "minus")
                            .padding(.all, 8)
                    }
                    //eksi olmaması için
                    .disabled(count == 0)
                    .frame(width: 30, height: 30)
                    .overlay(RoundedCorners(radius: 50).stroke())
                    .foregroundColor(.black)
                    
                    Text("\(count)")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 8)
                    
                    //Plus Button
                    Button(action: {
                        self.count += 1
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(.all, 8)
                            .background(Color("Primary"))
                            .clipShape(Circle())
                    }
                }
                
            }
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornersRadius(30, corners: [.topLeft, .topRight])
        .offset(x: 0, y: -30.0)
    }
}

#Preview {
    DescriptionsViews(furniture: ModelData().furnitures[0])
}

struct RoundedCorners: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
extension View {
    func cornersRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorners(radius: radius, corners: corners) )
    }
}

struct ColorDotViews: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}
