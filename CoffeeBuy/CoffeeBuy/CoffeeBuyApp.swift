//
//  CoffeeBuyApp.swift
//  CoffeeBuy
//
//  Created by Kiran Kumar on 12/03/26.
//

import SwiftUI

@main
struct CoffeeBuyApp: App {
    
    @StateObject private var model: CoffeeModel
    
    init() {
        let webservice = Webservice()
        _model = StateObject(wrappedValue: CoffeeModel(webservice: webservice))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(model)
        }
    }
}
