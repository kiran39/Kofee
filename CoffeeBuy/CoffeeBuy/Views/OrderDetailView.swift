//
//  OrderDetailView.swift
//  CoffeeBuy
//
//  Created by Kiran Kumar on 13/03/26.
//

import SwiftUI

struct OrderDetailView: View {
    
    let orderId: Int
    @EnvironmentObject private var model: CoffeeModel
    @State private var isPresented: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            
            if let order = model.orderById(orderId) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(order.coffeeName)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .accessibilityIdentifier("coffeeNameText")
                    Text(order.size.rawValue)
                        .opacity(0.5)
                    Text(order.total as NSNumber, formatter: NumberFormatter.currency)
                    
                    Button("Edit Order") {
                        isPresented = true
                    }.accessibilityIdentifier("editOrderButton")
                        .centerHorizontally()
                }.sheet(isPresented: $isPresented) {
                    AddCoffeeView(order: order)
                }
            }
            Spacer()
        }.padding()
    }
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let webservice = Webservice()
        let model = CoffeeModel(webservice: webservice)
        return OrderDetailView(orderId: 1)
            .environmentObject(model)
    }
}
