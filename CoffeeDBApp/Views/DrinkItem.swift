//
//  DrinkItem.swift
//  UITest
//
//  Created by Osvaldo Murillo on 12/7/19.
//  Copyright © 2019 Osvaldo Murillo. All rights reserved.
//

import SwiftUI


struct DrinkItem: View {
    var drink: Drink
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Image(drink.imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 170)
                .cornerRadius(10)
                .shadow(radius: 0)
            
            VStack(alignment: .leading, spacing: 5.0) {
            Text(drink.name)
                .colorMultiply(.primary)
                .font(.headline)
            Text(drink.description)
                .font(.subheadline)
                .colorMultiply(.secondary)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
                .frame(height: 90)
            }
        }
    }
}

struct DrinkItem_Previews: PreviewProvider {
    static var previews: some View {
        DrinkItem(drink: drinkData[0])
    }
}
