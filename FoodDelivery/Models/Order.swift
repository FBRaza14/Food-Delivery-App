//
//  Order.swift
//  FoodDelivery
//
//  Created by Fahad Bin Raza on 29/09/2022.
//

import Foundation


struct Order: Decodable{
    let id : String?
    let name :String?
    let dish : Dish?
}
