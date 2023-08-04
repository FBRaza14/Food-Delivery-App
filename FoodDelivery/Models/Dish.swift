//
//  Dish.swift
//  FoodDelivery
//
//  Created by Fahad Bin Raza on 27/09/2022.
//


import Foundation

struct Dish: Decodable {
    let id, name, description, image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
    }
}
