//
//  APIEndpoints.swift
//  CoffeeBuy
//
//  Created by Assistant on 15/03/26.
//

import Foundation

enum API {
    // Base URL for the backend
    static let baseURL = URL(string: "https://azamsharp-server-dddabf536d7a.herokuapp.com")!

    enum Path {
        static let test = "/test"
        static let orders = "/orders"
        static let newOrder = "/new-order"
    }

    enum Endpoint {
        // GET /test/orders
        static var getOrders: URL { baseURL.appendingPathComponent(Path.test + Path.orders) }

        // POST /test/new-order
        static var placeOrder: URL { baseURL.appendingPathComponent(Path.test + Path.newOrder) }

        // PUT /test/orders/{id}
        static func updateOrder(id: Int) -> URL {
            baseURL.appendingPathComponent(Path.test + Path.orders + "/\(id)")
        }

        // DELETE /test/orders/{id}
        static func deleteOrder(id: Int) -> URL {
            baseURL.appendingPathComponent(Path.test + Path.orders + "/\(id)")
        }
    }
}
