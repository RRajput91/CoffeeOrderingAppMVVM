//
//  OrdersTableViewController.swift
//  CoffeeOrderingAppMVVM
//
//  Created by mac on 21/07/25.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {
    
    var ordersViewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateOrders()
    }
    
    private func populateOrders(){
        
        guard let coffeeOrdersURL = URL(string: "https://687df9c2c07d1a878c30b206.mockapi.io/orders") else {
            fatalError("URL is incorrect")
        }

        let resource = Resource<[Order]>(url: coffeeOrdersURL)
        WebService().load(resource: resource) {[weak self] result in
        
            switch result{
            case.success(let orders):
                self?.ordersViewModel.ordersViewModel = orders.map(OrderViewModel.init)
                self?.tableView.reloadData()
                print(orders)
            case.failure(let error):
                print(error)
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ordersViewModel.ordersViewModel.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = self.ordersViewModel.orderViewModel(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = vm.type
        cell.detailTextLabel?.text = vm.size
        return cell
    }
}
