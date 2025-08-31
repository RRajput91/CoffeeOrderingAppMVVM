//
//  Order.swift
//  CoffeeOrderingAppMVVM
//
//  Created by mac on 21/07/25.
//

import Foundation

enum CoffeeType: String, Codable {
    case cappuccino
    case lattee
    case espressino
    case cartado
}
enum CoffeeSize: String, Codable {
    case small
    case medium
    case large
}
struct Order: Codable {
    
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
}
