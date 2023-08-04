//
//  DishCategory.swift
//  FoodDelivery
//
//  Created by Fahad Bin Raza on 26/09/2022.
//

import Foundation

struct DishCategory: Decodable{
    let id,name,image : String?

 enum CodingKeys: String, CodingKey {
    case id
    case name = "title"
    case image
}
}
