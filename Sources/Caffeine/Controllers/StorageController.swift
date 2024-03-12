//
//  StorageController.swift
//  Caffeine
//
//  Created by Jota Uribe on 4/02/24.
//

import Foundation

// Defines convenience methods for ´Codable´ types storage.
public protocol StorageController {
    func read<T>(with key: String) throws -> T? where T: Decodable
    func write<T>(with key: String, value: T) throws where T: Encodable
}

extension UserDefaults: StorageController {
    public func read<T>(with key: String) throws -> T? where T : Decodable {
        guard let data = data(forKey: key) else { return nil }
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    public func write<T>(with key: String, value: T) throws where T : Encodable {
        let data = try JSONEncoder().encode(value)
        setValue(data, forKey: key)
    }
}

public extension Decodable {
    static func read(_ controller: StorageController = UserDefaults.standard, cacheKey: String) throws -> Self? {
        return try controller.read(with: cacheKey)
    }
}

public extension Encodable {
    func write(_ controller: StorageController = UserDefaults.standard, cacheKey: String) throws {
        try controller.write(with: cacheKey, value: self)
    }
}
