//
//  Order.swift
//  CoffeeBuy
//
//  Created by Kiran Kumar on 12/03/26.
//

import Foundation

enum CoffeeOrderError: Error {
    case invalidOrderId
}

enum CoffeeSize: String, Codable, CaseIterable {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
}

struct OrderElement: Codable, Identifiable, Hashable {
    var id: Int?
    var name, coffeeName: String
    var total: Double
    var size: CoffeeSize
}
