//
//  Button+SFSymbol.swift
//  Caffeine
//
//  Created by Jota Uribe on 1/11/24.
//

import SwiftUI

public extension Button where Label == SwiftUI.Label<Text, Image> {
    init(role: ButtonRole? = .none, action: @escaping () -> Void, title: LocalizedStringResource, symbol: SFSymbol) {
        self.init(role: role, action: action, label: { Label(title, symbol: symbol) })
    }
}
