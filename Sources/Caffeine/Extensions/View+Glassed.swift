//
//  View+Glassed.swift
//  Caffeine
//
//  Created by Jota Uribe on 17/07/26.
//

import SwiftUI

public extension View {
    @ViewBuilder
    func glassed<S: Shape>(_ shape: S = Capsule()) -> some View {
#if os(visionOS)
        self.background(.thinMaterial).clipShape(shape)
#else
        if #available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *) {
            self.glassEffect(in: shape)
        } else {
            self.background(.thinMaterial).clipShape(shape)
        }
#endif
    }
}
