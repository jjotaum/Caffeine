//
//  Array+Operations.swift
//  Caffeine
//
//  Created by Jota Uribe on 14/07/23.
//

import Foundation

public extension Array {
    /// Return prefixed array if is ´numberOfItems´ is contained in ´indices´ otherwise return ´self´.
    func prefixed(upTo numberOfItems: Int) -> [Element] {
        guard indices.contains(numberOfItems) else { return self }
        return Array(prefix(upTo: numberOfItems))
    }
}
