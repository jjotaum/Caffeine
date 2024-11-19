//
//  LabelDisplayable.swift
//  Caffeine
//
//  Created by Jota Uribe on 1/11/24.
//

import Foundation
import SwiftUI

@available(iOS 16, *)
@available(macOS 13, *)
@available(tvOS 16, *)
@available(watchOS 9, *)
protocol LabelDisplayable {
    var localizedValue: LocalizedStringResource { get }
    var symbol: SFSymbol { get }
}

@available(iOS 16, *)
@available(macOS 13, *)
@available(tvOS 16, *)
@available(watchOS 9, *)
extension LabelDisplayable {
    func button(role: ButtonRole? = .none, action: @escaping () -> Void) -> Button<Label<Text, Image>> {
        Button(role: role, action: action, title: localizedValue, symbol: symbol)
    }
    
    func image() -> Image {
        Image(symbol)
    }
    
    func label() -> Label<Text, Image> {
        Label(localizedValue, symbol: symbol)
    }
}
