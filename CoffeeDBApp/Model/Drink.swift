//
//  Drink.swift
//  UITest
//
//  Created by Osvaldo Murillo on 12/7/19.
//  Copyright © 2019 Osvaldo Murillo. All rights reserved.
//

import SwiftUI


struct Drink: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var imageName: String
    var category: Category
    var description: String
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case hot = "design sketch"
        case cold = "design area"
        case normal = "furniture"
    }
    
}
