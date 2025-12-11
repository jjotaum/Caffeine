//
//  LabelDisplayable.swift
//  Caffeine
//
//  Created by Jota Uribe on 1/11/24.
//

import Foundation
import SwiftUI

public protocol LabelDisplayable {
    var localizedValue: LocalizedStringResource { get }
    var symbol: SFSymbol { get }
}

public extension LabelDisplayable {
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
