//
//  Label+SFSymbol.swift
//  Caffeine
//
//  Created by Jota Uribe on 14/03/24.
//

import SwiftUI

public extension Label where Title == Text, Icon == Image {
    @available(iOS 16, *)
    @available(macOS 13, *)
    @available(tvOS 16, *)
    @available(watchOS 9, *)
    init(_ localizedString: LocalizedStringResource, symbol: SFSymbol) {
        self.init(localizedString.key, systemImage: symbol.systemImage)
    }
    
    init(_ titleKey: LocalizedStringKey, symbol: SFSymbol) {
        self.init(titleKey, systemImage: symbol.systemImage)
    }
    
    init(_ title: String, symbol: SFSymbol) {
        self.init(title, systemImage: symbol.systemImage)
    }
}
