//
//  ClippedBordered.swift
//  Caffeine
//
//  Created by Jota Uribe on 11/04/25.
//

import SwiftUI

public struct ClippedBordered<S>: ViewModifier where S: Shape {
    private let shape: S
    private let color: Color
    private let lineWidth: CGFloat
    
    public init(_ shape: S, color: Color, lineWidth: CGFloat) {
        self.shape = shape
        self.color = color
        self.lineWidth = lineWidth
    }
    
    public func body(content: Content) -> some View {
        content
            .clipShape(shape)
            .overlay {
                shape.stroke(color, lineWidth: lineWidth)
            }
    }
}

public extension View {
    func clippedBordered<S: Shape>(_ shape: S, color: Color, lineWidth: CGFloat = .one) -> some View {
        modifier(ClippedBordered(shape, color: color, lineWidth: lineWidth))
    }
}
