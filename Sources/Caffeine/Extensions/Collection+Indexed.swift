//
//  Collection+Indexed.swift
//  Caffeine
//
//  Created by Jota Uribe on 18/07/26.
//

import Foundation

public extension Collection {
    func indexed() -> [(Index, Element)] {
        Array(zip(indices, self))
    }
}
