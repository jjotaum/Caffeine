//
//  ClippedBordered.swift
//  Caffeine
//
//  Created by Jota Uribe on 11/04/25.
//

import SwiftUI

public struct ClippedBordered<S, Style: ShapeStyle>: ViewModifier where S: Shape {
    private let shape: S
    private let style: Style
    private let lineWidth: CGFloat
    
    public init(_ shape: S, style: Style, lineWidth: CGFloat) {
        self.shape = shape
        self.style = style
        self.lineWidth = lineWidth
    }
    
    public func body(content: Content) -> some View {
        content
            .clipShape(shape)
            .contentShape(shape)
            .overlay {
                shape.stroke(style, lineWidth: lineWidth)
            }
    }
}

public extension View {
    func clippedBordered<S: Shape, Style: ShapeStyle>(_ shape: S, style: Style, lineWidth: CGFloat = .one) -> some View {
        modifier(ClippedBordered(shape, style: style, lineWidth: lineWidth))
    }
}
