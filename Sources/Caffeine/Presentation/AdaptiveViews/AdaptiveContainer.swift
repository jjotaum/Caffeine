//
//  AdaptiveContainer.swift
//  Caffeine
//
//  Created by Jota Uribe on 20/02/26.
//

import SwiftUI

/// A wrapper to easiliy adapt views that needs to change depending on `horizontalSizeClass`.
public struct AdaptiveContainer<Regular: View, Extended: View>: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    private let regular: () -> Regular
    private let extended: () -> Extended

    public init(
        @ViewBuilder regular: @escaping () -> Regular,
        @ViewBuilder extended: @escaping () -> Extended
    ) {
        self.regular = regular
        self.extended = extended
    }

    public var body: some View {
        if horizontalSizeClass == .compact {
            regular()
        } else {
            extended()
        }
    }
}
