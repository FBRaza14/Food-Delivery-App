//
//  StringExtension.swift
//  FoodDelivery
//
//  Created by Fahad Bin Raza on 26/09/2022.
//

import Foundation



extension String {
    
    var asUrl : URL?{
        return URL(string : self)
    }
}
