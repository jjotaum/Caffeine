//
//  View+Conditional.swift
//  Caffeine
//
//  Created by Jota Uribe on 11/04/25.
//

import SwiftUI

/// Author: https://www.avanderlee.com/swiftui/conditional-view-modifier/

public extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
}
