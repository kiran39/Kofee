//
//  OrderCellView.swift
//  CoffeeBuy
//
//  Created by Kiran Kumar on 12/03/26.
//

import SwiftUI

struct OrderCellView: View {
    
    let order: OrderElement
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(order.name).accessibilityIdentifier("orderNameText")
                    .bold()
                Text(verbatim: "\(order.coffeeName) (\(order.size))")
                    .accessibilityIdentifier("coffeeNameAndSizeText")
                    .opacity(0.5)
                
            }
            Spacer()
            Text(order.total as NSNumber, formatter: NumberFormatter.currency)
                .accessibilityIdentifier("coffeePriceText")
        }
    }
}

