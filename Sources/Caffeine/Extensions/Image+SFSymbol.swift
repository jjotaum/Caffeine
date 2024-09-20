//
//  Image+SFSymbol.swift
//  Caffeine
//
//  Created by Jota Uribe on 14/03/24.
//

import SwiftUI

public extension Image {
    init(_ symbol: SFSymbol) {
        switch symbol.kind {
        case .system(let systemName):
            self.init(systemName: systemName)
        case .custom(let name):
            self.init(name)
        }
    }
}
