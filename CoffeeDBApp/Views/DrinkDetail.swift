//
//  DrinkDetail.swift
//  UITest
//
//  Created by Osvaldo Murillo on 12/8/19.
//  Copyright © 2019 Osvaldo Murillo. All rights reserved.
//

import SwiftUI


struct DrinkDetail: View {
    var drink: Drink
    var body: some View {
        List{
            ZStack (alignment: .bottom){
                Image(drink.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Rectangle()
                    .frame(height: 80)
                    .opacity(0.25)
                    .blur(radius: 10)
                HStack {
                    VStack(alignment: .leading, spacing: 1) {
                        Text(drink.name)
                            .colorInvert()
                            .font(.largeTitle)
                    }
                    .padding(.leading)
                    .padding(.bottom)
                    Spacer()
                }
                
            }
            .listRowInsets(EdgeInsets())
            VStack {
                Text(drink.description)
                    .colorMultiply(.primary)
                    .font(.body)
                    .lineLimit(nil)
                    .lineSpacing(10)
                HStack {
                    OrderButton()
                }.padding(.top, 50)
            }.padding(.top)
                .padding(.bottom)
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
        
    }
}

struct OrderButton : View {
    var body: some View {
        Button(action: {}) {
            Text("Order Now")
        }.frame(width: 200, height: 50)
            .foregroundColor(.white)
            .font(.headline)
            .background(Color.blue)
            .cornerRadius(15)
        
    }
}

struct DrinkDetail_Previews: PreviewProvider {
    static var previews: some View {
        DrinkDetail(drink: drinkData[4])
    }
}
