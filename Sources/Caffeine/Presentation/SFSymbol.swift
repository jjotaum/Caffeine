//
//  SFSymbol.swift
//  Caffeine
//
//  Created by Jota Uribe on 14/03/24.
//

import Foundation

/// A custom type defined to facilitate usage of ´SFSymbols´.
/// Please see ´Image+SFSymbol´ & ´Label+SFSymbol´ extensions for reference on how to use it.
public struct SFSymbol {
    var kind: Kind
}

extension SFSymbol {
    enum Kind {
        case system(systemName: String)
        case custom(imageName: String)
    }
}

extension SFSymbol: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        kind = .system(systemName: value)
    }
}

extension SFSymbol {
    public init(custom imageName: String) {
        kind = .custom(imageName: imageName)
    }
}
