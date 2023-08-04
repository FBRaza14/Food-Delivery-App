//
//  OnboardingCollectionViewCell.swift
//  FoodDelivery
//
//  Created by Fahad Bin Raza on 26/09/2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = String (describing: OnboardingCollectionViewCell.self)
    @IBOutlet weak var slideImageV: UIImageView!
    
    
    @IBOutlet weak var slideTitleLbl: UILabel!
    
    @IBOutlet weak var slideDiscriptionLbl: UILabel!
    
    
    
    func setup(_ slide : OnboardingSlide){
        slideImageV.image = slide.image
        slideTitleLbl.text = slide.title
        slideDiscriptionLbl.text = slide.description
        
    }
    


    
}
