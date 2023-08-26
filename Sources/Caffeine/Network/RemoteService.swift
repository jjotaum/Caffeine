//
//  RemoteService.swift
//  Caffeine
//
//  Created by Jota Uribe on 23/08/23.
//

import Combine
import Foundation

public protocol RemoteService {
    func load<T: Decodable>(endpoint: RemoteEndpoint, completion: @escaping (RequestResult<T>) -> Void) throws
    @available(iOS 15.0, *)
    @available(macOS 12.0, *)
    func load<T: Decodable>(endpoint: RemoteEndpoint) async throws -> T
    func load<T: Decodable>(endpoint: RemoteEndpoint) throws -> AnyPublisher<T, Error>
}

public class BaseRemoteService: RemoteService {
    private let coordinator: RequestCoordinator
    private let decoder: RequestDecoder
    private let remoteAPI: RemoteAPI
    
    public init(coordinator: RequestCoordinator = URLSession.shared, decoder: RequestDecoder = JSONDecoder(), remoteAPI: RemoteAPI) {
        self.coordinator = coordinator
        self.decoder = decoder
        self.remoteAPI = remoteAPI
    }
    
    public func load<T: Decodable>(endpoint: RemoteEndpoint, completion: @escaping (RequestResult<T>) -> Void) throws {
        let request = try remoteAPI.urlRequest(endpoint)
        coordinator.dataTask(request: request, decoder: decoder, completion: completion)
    }
    
    @available(iOS 15.0, *)
    @available(macOS 12.0, *)
    public func load<T>(endpoint: RemoteEndpoint) async throws -> T where T : Decodable {
        let request = try remoteAPI.urlRequest(endpoint)
        return try await coordinator.data(request: request, decoder: decoder)
    }
    
    public func load<T: Decodable>(endpoint: RemoteEndpoint) throws -> AnyPublisher<T, Error> {
        let request = try remoteAPI.urlRequest(endpoint)
        return try coordinator.dataTaskPublisher(for: request, decoder: decoder)
    }
}

public extension BaseRemoteService {
    func url(for endpoint: RemoteEndpoint) throws -> URL {
        try remoteAPI.url(endpoint)
    }
}
