//
//  Storable.swift
//  Caffeine
//
//  Created by Jota Uribe on 4/02/24.
//

import Foundation

// Defines convenience methods to make use of ´StorageController´.
public protocol Storable: Codable {
    var cacheKey: String { get }
}

public extension Storable {
    func read(_ controller: StorageController = UserDefaults.standard) throws -> Self? {
        return try controller.read(with: cacheKey)
    }
    
    func write(_ controller: StorageController = UserDefaults.standard) throws {
        try controller.write(with: cacheKey, value: self)
    }
}
