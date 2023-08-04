//
//  ApiResponse.swift
//  FoodDelivery
//
//  Created by Fahad Bin Raza on 30/09/2022.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
