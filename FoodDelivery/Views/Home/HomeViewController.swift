//
//  HomeViewController.swift
//  FoodDelivery
//
//  Created by Fahad Bin Raza on 26/09/2022.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {

    @IBOutlet weak var foodCategoryCollectionView: UICollectionView!
    
    @IBOutlet weak var popularDishesCollectionView: UICollectionView!
    
    @IBOutlet weak var specialDishesCollectionView: UICollectionView!
    var categories : [DishCategory] = []
    var dishes : [Dish] = []
    var specials : [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        popularDishesCollectionView.delegate = self
        popularDishesCollectionView.dataSource = self
        specialDishesCollectionView.delegate = self
        specialDishesCollectionView.dataSource = self
        registerCells()
        ProgressHUD.show()
        ProgressHUD.colorAnimation = .systemGreen
        NetworkService.shared.fetchCategories(){
            [weak self] (result) in
            switch result{
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self?.categories = allDishes.categories ?? []
                self?.dishes = allDishes.popularDishes ?? []
                self?.specials = allDishes.specialDishes ?? []
                self?.foodCategoryCollectionView.reloadData()
                self?.popularDishesCollectionView.reloadData()
                self?.specialDishesCollectionView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    

    }
    private func registerCells(){
        
        foodCategoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularDishesCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        specialDishesCollectionView.register(UINib(nibName: LandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: LandscapeCollectionViewCell.identifier)
    }

   

}

extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case foodCategoryCollectionView:
            return categories.count
            
        case popularDishesCollectionView:
            return dishes.count
        case specialDishesCollectionView:
            return specials.count
            
        default: return 0
            
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch collectionView{
        case foodCategoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
            
        case popularDishesCollectionView:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: dishes[indexPath.row])
            return cell
            
        case specialDishesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LandscapeCollectionViewCell.identifier, for: indexPath) as! LandscapeCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
            
        default: return UICollectionViewCell()
            
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == foodCategoryCollectionView {
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }else{
            let controller = DishDetailsCollectionViewViewController.instantiate()
            controller.dish = collectionView == popularDishesCollectionView ? dishes[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
   
}
