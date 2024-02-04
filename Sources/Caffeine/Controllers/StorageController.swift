//
//  StorageController.swift
//  Caffeine
//
//  Created by Jota Uribe on 4/02/24.
//

import Foundation

// Defines convenience methods for ´Codable´ types storage.
public protocol StorageController {
    func read<T>(with key: String) throws -> T? where T: Codable
    func write<T>(with key: String, value: T) throws where T: Codable
}

extension UserDefaults: StorageController {
    public func read<T>(with key: String) throws -> T? where T : Codable {
        guard let data = data(forKey: key) else { return nil }
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    public func write<T>(with key: String, value: T) throws where T : Codable {
        let data = try JSONEncoder().encode(value)
        setValue(data, forKey: key)
    }
}
