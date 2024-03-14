//
//  Image+SFSymbol.swift
//  Caffeine
//
//  Created by Jota Uribe on 14/03/24.
//

import SwiftUI

extension Image {
    init(_ symbol: SFSymbol) {
        self.init(systemName: symbol.systemImage)
    }
}
