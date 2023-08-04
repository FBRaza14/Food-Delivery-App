//
//  DishDetailsCollectionViewViewController.swift
//  FoodDelivery
//
//  Created by Fahad Bin Raza on 28/09/2022.
//

import UIKit
import ProgressHUD

class DishDetailsCollectionViewViewController: UIViewController {
    
    @IBOutlet weak var dishImageDetail: UIImageView!
    
    
    @IBOutlet weak var dishTitleLabel: UILabel!
    
    @IBOutlet weak var dishCaloriesLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    var dish : Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentView()
    }
    private func presentView(){
        
        
        
        if dish.name == "Pizza Napoletana"{
            dishImageDetail.kf.setImage(with: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiiSAr2NGPjPSfwTMI08Eg1McQK12ba3ODRUZCZ5wW1Q4YIPhs6hUPaxsLbujBjFxsyv4&usqp=CAU"))
            dishTitleLabel.text = dish.name
            descriptionLabel.text = dish.description
            dishCaloriesLabel.text = dish.formattedCalories
        }else{
            dishImageDetail.kf.setImage(with: dish.image?.asUrl)
            dishTitleLabel.text = dish.name
            descriptionLabel.text = dish.description
            dishCaloriesLabel.text = dish.formattedCalories
        }
        
    }
    
    @IBAction func placeOrderbtnClicked(_ sender: UIButton) {
        
        guard let nameField = nameField.text?.trimmingCharacters(in: .whitespaces), !nameField.isEmpty else{
            ProgressHUD.showError("Please Enter Your Name")
            return
        }
        
        ProgressHUD.show("Placing Order....")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: nameField) { (result) in
                    switch result {
                    case .success(_):
                        ProgressHUD.showSuccess("Your order has been received. 👨🏼‍🍳")
                    case .failure(let error):
                        ProgressHUD.showError(error.localizedDescription)
                    }
                }
            }
}
