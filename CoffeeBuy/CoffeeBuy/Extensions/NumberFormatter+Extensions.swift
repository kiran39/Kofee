//
//  NumberFormatter+Extensions.swift
//  CoffeeBuy
//
//  Created by Kiran Kumar on 12/03/26.
//

import Foundation

extension NumberFormatter {
    
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
    
}
