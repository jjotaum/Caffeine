//
//  Setting.swift
//  Caffeine
//
//  Created by Jota Uribe on 30/01/25.
//

import Foundation
import SwiftUI

public protocol Setting: Hashable, RawRepresentable {
    static var key: String { get }
    static var defaultValue: Self { get }
    static var localizedDescription: LocalizedStringResource { get }
    var localizedValue: LocalizedStringResource { get }
}


public extension AppStorage where Value: Setting, Value.RawValue == Int {
    init(wrappedValue: Value = .defaultValue, _ key: String = Value.key) {
        self.init(wrappedValue: wrappedValue, key, store: .standard)
    }
}

public extension AppStorage where Value: Setting, Value.RawValue == String {
    init(wrappedValue: Value = .defaultValue, _ key: String = Value.key) {
        self.init(wrappedValue: wrappedValue, key, store: .standard)
    }
}
