//
//  UIview+Extensions.swift
//  FoodDelivery
//
//  Created by Fahad Bin Raza on 23/09/2022.
//

import UIKit



extension UIView{
    
    
    
    @IBInspectable var cornerRadius : CGFloat {
        
        get{
            return self.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
        
    }
    
}
