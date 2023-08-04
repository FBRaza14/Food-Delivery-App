//
//  Route.swift
//  FoodDelivery
//
//  Created by Fahad Bin Raza on 29/09/2022.
//

import Foundation
import CoreVideo



enum Route {
    
    static let baseUrl = "https://yummie.glitch.me"
    case fetchCategories
    case placeorder(String)
    case fetchCategoryDishes(String)
    case fetchOrders
    
    var description: String{
        switch self {
        case .fetchCategories:
            return "/dish-categories"
        case .placeorder(let dishId):
            return "/orders/\(dishId)"
        case .fetchCategoryDishes(let categoryId):
            return "/dishes/\(categoryId)"
        case .fetchOrders:
            return "/orders"
        }
    }
    
    
    
}
