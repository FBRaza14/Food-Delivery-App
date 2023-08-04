//
//  NetworkService.swift
//  FoodDelivery
//
//  Created by Fahad Bin Raza on 29/09/2022.
//

import Foundation

struct NetworkService{
    
    
    static let shared = NetworkService()
    
    private init (){}
    
    func fetchCategories(completion: @escaping(Result<AllDishes,Error>)->Void){
        Request(route: .fetchCategories, method: .get, completion: completion)
    }
    
    func placeOrder(dishId: String, name: String, completion: @escaping(Result<Order, Error>) -> Void) {
            let params = ["name": name]
            Request(route: .placeorder(dishId), method: .post, parameters: params, completion: completion)
        }
    
    func fetchCategoryDishes(categoryId: String, completion: @escaping(Result<[Dish], Error>) -> Void) {
        Request(route: .fetchCategoryDishes(categoryId), method: .get, completion: completion)
        }
    
    func fetchOrders(completion: @escaping(Result<[Order], Error>)->Void){
        Request(route: .fetchOrders, method: .get, completion: completion)
    }
    
    private func Request<T: Decodable>(route: Route,method : Method, parameters: [String: Any]? = nil,completion: @escaping(Result<T,Error>)->Void){
        
        guard let request = createRequest(route: route, method: method,parameters: parameters) else{
            completion(.failure(AppError.invalidUrl))
            return}
        URLSession.shared.dataTask(with: request) { data, response, error in
                 var result: Result<Data, Error>?
                 if let data = data {
                     result = .success(data)
                     let responseString = String(data: data, encoding: .utf8) ?? "Could not stringify our data"
                     print("The response is:\n\(responseString)")
                 } else if let error = error {
                     result = .failure(error)
                     print("The error is: \(error.localizedDescription)")
                 }
                 
                 DispatchQueue.main.async {
                     self.handleResponse(result: result, completion: completion)
                 }
             }.resume()
    }
    
    
    
    /// Function to generate a url request
    /// - Parameters:
    ///   - route: the path of the backend
    ///   - method: method can be GET, POST, DELETE,PATCH
    ///   - parameters: EXTRA info to be pass to server
    /// - Returns: url request will be returned
    private func createRequest(route: Route,method : Method, parameters: [String: Any]? = nil)->URLRequest?{
        
        
        let urlString = Route.baseUrl + route.description
        
        guard let url = urlString.asUrl else{
            return nil
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map{
                    URLQueryItem(name: $0, value: "\($1)")
                }
                
                urlRequest.url = urlComponent?.url
            case .post, .delete , .patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
            
        }
        return urlRequest
    }
    
    
    private func handleResponse<T: Decodable>(result: Result<Data, Error>?,
                                              completion: (Result<T, Error>) -> Void) {
        guard let result = result else {
            completion(.failure(AppError.unknownError))
            return
        }
        
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(ApiResponse<T>.self, from: data) else {
                completion(.failure(AppError.errorDecoding))
                return
            }
            
            if let error = response.error {
                completion(.failure(AppError.serverError(error)))
                return
            }
            
            if let decodedData = response.data {
                completion(.success(decodedData))
            } else {
                completion(.failure(AppError.unknownError))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
}
