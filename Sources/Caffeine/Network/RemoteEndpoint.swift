//
//  RemoteEndpoint.swift
//  Caffeine
//
//  Created by Jota Uribe on 23/08/23.
//

import Foundation

public struct RemoteEndpoint {
    let path: String
    let httpMethod: String
    let body: Data?
    let queryItems: [URLQueryItem]
    
    public init(path: String, httpMethod: String, body: Data?, queryItems: [URLQueryItem]) {
        self.path = path
        self.httpMethod = httpMethod
        self.body = body
        self.queryItems = queryItems
    }
}
