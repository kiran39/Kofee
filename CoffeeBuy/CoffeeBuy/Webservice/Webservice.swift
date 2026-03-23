//
//  Webservice.swift
//  CoffeeBuy
//
//  Created by Kiran Kumar on 12/03/26.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case decodingError
    case badUrl
}

class Webservice {
    
    func updateOrder(_ order: OrderElement) async throws -> OrderElement {
        
        guard let orderId = order.id else {
            throw NetworkError.badRequest
        }
        let url = API.Endpoint.updateOrder(id: orderId)
       
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(order)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        guard let updatedOrder = try? JSONDecoder().decode(OrderElement.self, from: data) else {
            throw NetworkError.decodingError
        }
        
        return updatedOrder
        
    }
    
    func deleteOrder(orderId: Int) async throws -> OrderElement {
        
        let url = API.Endpoint.deleteOrder(id: orderId)
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        guard let deletedOrder = try? JSONDecoder().decode(OrderElement.self, from: data) else {
            throw NetworkError.decodingError
        }
        
        return deletedOrder
    }
    
    func getOrders() async throws -> [OrderElement] {
        
        let url = API.Endpoint.getOrders
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        guard let orders = try? JSONDecoder().decode([OrderElement].self, from: data) else {
            throw NetworkError.decodingError
        }
        
        return orders
    }
    
    func placeOrder(order: OrderElement) async throws -> OrderElement {
        
        let url = API.Endpoint.placeOrder
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(order)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
                     httpResponse.statusCode == 200 else {
                   throw NetworkError.badRequest
        }
        
        guard let newOrder = try? JSONDecoder().decode(OrderElement.self, from: data) else {
            throw NetworkError.decodingError
        }
        
        return newOrder
        
    }
}

