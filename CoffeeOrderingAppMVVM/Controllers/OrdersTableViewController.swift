//
//  OrdersTableViewController.swift
//  CoffeeOrderingAppMVVM
//
//  Created by mac on 21/07/25.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateOrders()
    }
    
    private func populateOrders(){
        
        guard let coffeeOrdersURL = URL(string: "") else {
            fatalError("URL is incorrect")
            
        }
        
        let resource = Resource<[Order]>(url: coffeeOrdersURL)
        WebService().load(resource: resource) {result in
        
            switch result{
            case.success(let orders):
                print(orders)
            case.failure(let error):
                print(error)
            }
        
            
        }
    }
}
