//
//  SFSymbol.swift
//  Caffeine
//
//  Created by Jota Uribe on 14/03/24.
//

import Foundation

/// A custom defined to facilitate usage of ´SFSymbols´.
/// Please see ´Image+SFSymbol´ & ´Label+SFSymbol´ extensions for reference on how to use it.
public struct SFSymbol {
    var systemImage: String
}

extension SFSymbol: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        systemImage = value
    }
}
