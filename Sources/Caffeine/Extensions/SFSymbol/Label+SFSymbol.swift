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
        switch symbol.kind {
        case .system(let systemName):
            self.init(localizedString.key, systemImage: systemName)
        case .custom(let name):
            self.init(localizedString.key, image: name)
        }
    }
    
    init(_ titleKey: LocalizedStringKey, symbol: SFSymbol) {
        switch symbol.kind {
        case .system(let systemName):
            self.init(titleKey, systemImage: systemName)
        case .custom(let name):
            self.init(titleKey, image: name)
        }
    }
    
    init(_ title: String, symbol: SFSymbol) {
        switch symbol.kind {
        case .system(let systemName):
            self.init(title, systemImage: systemName)
        case .custom(let name):
            self.init(title, image: name)
        }
    }
}
