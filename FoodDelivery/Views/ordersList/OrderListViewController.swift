//
//  OrderListViewController.swift
//  FoodDelivery
//
//  Created by Fahad Bin Raza on 29/09/2022.
//

import UIKit
import ProgressHUD

class OrderListViewController: UIViewController {

    @IBOutlet weak var listOrderTableView: UITableView!
    
    var orders : [Order] = []

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        registerCells()
        ProgressHUD.show()
        ProgressHUD.animationType = .horizontalCirclesPulse
        ProgressHUD.colorAnimation = .systemGreen
        ProgressHUD.colorHUD = .white
    }
    override func viewDidAppear(_ animated: Bool) {
        NetworkService.shared.fetchOrders{ [weak self] (result) in
            switch result {
            case .success(let orders):
                ProgressHUD.dismiss()
                self?.orders = orders
                self?.listOrderTableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }

    private func registerCells(){
            
            //listOrderTableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forr: DishListTableViewCell.identifier)
        listOrderTableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
        }
}


extension OrderListViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if !orders.isEmpty{
            let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
            cell.setup(order: orders[indexPath.row])
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let controller = DishDetailsCollectionViewViewController.instantiate()
         controller.dish = orders[indexPath.row].dish
         navigationController?.pushViewController(controller, animated: true)
     }
    
    
    
}
