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
}
