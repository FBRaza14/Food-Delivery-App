//
//  DishPortraitCollectionViewCell.swift
//  FoodDelivery
//
//  Created by Fahad Bin Raza on 27/09/2022.
//

import UIKit

class DishPortraitCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DishPortraitCollectionViewCell"

    @IBOutlet weak var titlelLabel: UILabel!
    
    @IBOutlet weak var dishImage: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var calorieInfoLabel: UILabel!
    
    
    func setup(dish : Dish){
              titlelLabel.text = dish.name
             if titlelLabel.text == "Pizza Napoletana"{
                 dishImage.kf.setImage(with: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiiSAr2NGPjPSfwTMI08Eg1McQK12ba3ODRUZCZ5wW1Q4YIPhs6hUPaxsLbujBjFxsyv4&usqp=CAU"))
                 calorieInfoLabel.text = dish.formattedCalories
                descriptionLabel.text = dish.formattedCalories
             }else{
                 dishImage.kf.setImage(with: dish.image?.asUrl)
                 calorieInfoLabel.text = dish.formattedCalories
                descriptionLabel.text = dish.formattedCalories
             }
              
    }
}
