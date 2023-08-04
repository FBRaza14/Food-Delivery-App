//
//  UserDefaults+extension.swift
//  FoodDelivery
//
//  Created by Fahad Bin Raza on 17/05/2023.
//

import Foundation

extension UserDefaults {
    private enum UDKey: String {
        case isOnboard
    }
    
    var isOnboard: Bool {
        get {
            bool(forKey: UDKey.isOnboard.rawValue)
        }
        
        set {
            setValue(newValue, forKey: UDKey.isOnboard.rawValue)
        }
    }
}
