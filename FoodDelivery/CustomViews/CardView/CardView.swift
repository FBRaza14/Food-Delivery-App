//
//  CardView.swift
//  FoodDelivery
//
//  Created by Fahad Bin Raza on 27/09/2022.
//

import UIKit


class CardView: UIView{
    override init(frame: CGRect) {
            super.init(frame: frame)
            initialSetup()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            initialSetup()
        }
        
        private func initialSetup() {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = .zero
            layer.cornerRadius = 10
            layer.shadowOpacity = 0.1
            layer.shadowRadius = 10
            cornerRadius = 10
        }
}
