//
//  NetworkService.swift
//  VKNewsFeed
//
//  Created by Александр Мехович on 12/10/19.
//  Copyright © 2019 AlexMex. All rights reserved.
//

import Foundation

protocol Networking {
    func request(path: String, params: [String: String], completion: @escaping (Data?, Error?) -> Void)
}

final class NetworkService: Networking {
    
    private let authService: AuthService

    init(authService: AuthService = AppDelegate.shared().authService) {
        self.authService = authService
    }

    func request(path: String, params: [String : String], completion: @escaping (Data?, Error?) -> Void) {
        guard let token = authService.token else { return }
        var allParams = params
        allParams["access_token"] = token
        allParams["v"] = API.version
        let url = self.url(from: path, params: allParams)
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, comletion: completion)
        task.resume()
        print(url)
    }

    private func createDataTask(from request: URLRequest, comletion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request, completionHandler:  { (data, response, error) in
            DispatchQueue.main.async {
                comletion(data, error)
            }
        })
    }
    
    private func url(from path: String, params: [String: String]) -> URL {
        var components = URLComponents()
        
        components.scheme = API.scheme
        components.host = API.host
        components.path = path
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        
        return components.url!
    }
}
