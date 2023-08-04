//
//  CategoryCollectionViewCell.swift
//  FoodDelivery
//
//  Created by Fahad Bin Raza on 26/09/2022.
//

import UIKit
import Kingfisher


class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImageLabel: UIImageView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    static let identifier = String (describing: CategoryCollectionViewCell.self)
    
    func setup(category : DishCategory)
    {
        categoryLabel.text =  category.name
        categoryImageLabel.kf.setImage(with: category.image?.asUrl)
    }
    
}
