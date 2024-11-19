//
//  Button+SFSymbol.swift
//  Caffeine
//
//  Created by Jota Uribe on 1/11/24.
//

import SwiftUI

@available(iOS 16, *)
@available(macOS 13, *)
@available(tvOS 16, *)
@available(watchOS 9, *)
extension Button where Label == SwiftUI.Label<Text, Image> {
    init(role: ButtonRole? = .none, action: @escaping () -> Void, title: LocalizedStringResource, symbol: SFSymbol) {
        self.init(role: role, action: action, label: { Label(title, symbol: symbol) })
    }
}
