//
//  RequestCoordinator.swift
//  Caffeine
//
//  Created by Jota Uribe on 23/08/23.
//

import Combine
import Foundation

public typealias RequestResult<T> = Result<T, Error>

public protocol RequestDecoder {
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T: Decodable
}

extension JSONDecoder: RequestDecoder { }

public protocol RequestCoordinator {
    func dataTask<T: Decodable>(request: URLRequest, decoder: RequestDecoder, completion: @escaping (RequestResult<T>) -> Void)
    func data<T: Decodable>(request: URLRequest, decoder: RequestDecoder) async throws -> T
    func dataTaskPublisher<T: Decodable>(for request: URLRequest, decoder: RequestDecoder) throws -> AnyPublisher<T, Error>
}

extension URLSession: RequestCoordinator {
    public func dataTask<T>(request: URLRequest, decoder: RequestDecoder, completion: @escaping (RequestResult<T>) -> Void) where T : Decodable {
        dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    public func data<T>(request: URLRequest, decoder: RequestDecoder) async throws -> T where T : Decodable {
        let data: (Data, URLResponse) = try await data(for: request)
        return try decoder.decode(T.self, from: data.0)
    }
    
    public func dataTaskPublisher<T>(for request: URLRequest, decoder: RequestDecoder) throws -> AnyPublisher<T, Error> where T : Decodable {
        return dataTaskPublisher(for: request)
            .tryMap { try decoder.decode(T.self, from: $0.data) }
            .eraseToAnyPublisher()
    }
}

fileprivate extension URLResponse {
    var statusCode: String? {
        (self as? HTTPURLResponse)?.statusCode
    }
}
