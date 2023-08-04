//
//  AllDishes.swift
//  FoodDelivery
//
//  Created by Fahad Bin Raza on 17/05/2023.
//

import Foundation
import UIKit

struct AllDishes:Decodable{
    
    let categories: [DishCategory]?
    let popularDishes: [Dish]?
    let specialDishes: [Dish]?
    
    
    enum CodingKeys:  String, CodingKey {
        case categories
        case popularDishes = "populars"
        case specialDishes = "specials"
    }
}
