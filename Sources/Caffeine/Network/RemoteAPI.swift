//
//  RemoteAPI.swift
//  Caffeine
//
//  Created by Jota Uribe on 23/08/23.
//

import Foundation

public struct RemoteAPI {
    let scheme: String
    let host: String
    var port: Int?
    var cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy
    var timeOutInterval: TimeInterval = 10.0
}

extension RemoteAPI {
    
    func baseUrl() throws -> URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.port = port
        guard let url = components.url else { throw URLError(.badURL) }
        return url
    }
    
    func url(_ endpoint: RemoteEndpoint) throws -> URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = endpoint.path
        components.port = port
        components.queryItems = endpoint.queryItems
        guard let url = components.url else { throw URLError(.badURL) }
        return url
    }
    
    func urlRequest(_ endpoint: RemoteEndpoint) throws -> URLRequest {
        let url = try url(endpoint)
        var request = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeOutInterval)
        request.httpBody = endpoint.body
        return request
    }
}
