//
//  AdaptiveStack.swift
//  Caffeine
//
//  Created by Jota Uribe on 20/02/26.
//

import SwiftUI

/// A `stack` to easiliy adapt content orientation based on `horizontalSizeClass`.
public struct AdaptiveStack<Content: View>: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    private let spacing: CGFloat?
    private let hAlignment: HorizontalAlignment
    private let vAlignment: VerticalAlignment
    private let content: () -> Content

    public init(spacing: CGFloat? = nil, hAlignment: HorizontalAlignment = .center, vAlignment: VerticalAlignment = .center, @ViewBuilder content: @escaping () -> Content) {
        self.spacing = nil
        self.hAlignment = hAlignment
        self.vAlignment = vAlignment
        self.content = content
    }

    public var body: some View {
        if horizontalSizeClass == .compact {
            VStack(alignment: hAlignment, spacing: spacing, content: content)
        } else {
            HStack(alignment: vAlignment, spacing: spacing, content: content)
        }
    }
}
