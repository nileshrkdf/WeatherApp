//
//  ConnectionManager.swift
//  WeatherApp
//
//  Created by Nilesh Malviya on 3/28/21.
//

import Foundation

/// Enum for Connection Type
enum ConnectionType: String  {
    case get
    case post
}

/// Enum for Error Type
enum ErrorType {
    case connectionIssue
    case genericError
    case invalidURL
    case badJSON
}

/// This class will hep to make network calls
class ConnectionManager {
    
    /// Method to fetch remote data
    /// - Parameters :- url - remote url
    /// - Parameters :- methodType - connection type (get, post ..)
    /// - Parameters :- closure
    func makeRequest(url: URL, methodType: ConnectionType, completion: @escaping (Data?, ErrorType?) -> Void) {
        let session = URLSession.shared
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = methodType.rawValue
        let dataTask = session.dataTask(with: urlRequest, completionHandler: { (data, httpResponse, error) in
            let httpResponseValue = httpResponse as? HTTPURLResponse
            if httpResponseValue?.statusCode == 200 {
                if error == nil {
                    completion(data, nil)
                } else {
                    completion(nil, .genericError)
                }
            } else {
                completion(nil, .connectionIssue)
            }
        })
        dataTask.resume()
    }
}
