//
//  LandscapeCollectionViewCell.swift
//  FoodDelivery
//
//  Created by Fahad Bin Raza on 27/09/2022.
//

import UIKit

class LandscapeCollectionViewCell: UICollectionViewCell {

    
    static let identifier = String(describing: LandscapeCollectionViewCell.self)
    @IBOutlet weak var dishImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var caloriesLabel: UILabel!
    
    
    
    
    func setup(dish : Dish){
        
        dishImage.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name
        descriptionLabel.text =  dish.description
        caloriesLabel.text = dish.formattedCalories
        
    }
    
}
