//
//  ViewFrameSizeModifier.swift
//  Caffeine
//
//  Created by Jota Uribe on 11/04/24.
//

import struct CoreGraphics.CGSize
import SwiftUI

public enum ViewFrameSize {
    case exact(CGSize)
    case ideal(CGSize)
    case minimum(CGSize)
    case maximum(CGSize)
}

public struct ViewFrameSizeModifier: ViewModifier {
    private let size: ViewFrameSize
    private let alignment: Alignment
    
    public init(size: ViewFrameSize, alignment: Alignment) {
        self.size = size
        self.alignment = alignment
    }

    public func body(content: Content) -> some View {
        switch size {
        case .exact(let size):
            content.frame(width: size.width, height: size.height, alignment: alignment)
        case .ideal(let size):
            content.frame(idealWidth: size.width, idealHeight: size.height, alignment: alignment)
        case .minimum(let size):
            content.frame(minWidth: size.width, minHeight: size.height, alignment: alignment)
        case .maximum(let size):
            content.frame(maxWidth: size.width, maxHeight: size.height, alignment: alignment)
        }
    }
}

public extension View {
    func frame(size: CGSize, alignment: Alignment = .center) -> some View {
        modifier(ViewFrameSizeModifier(size: .exact(size), alignment: alignment))
    }
    
    func frame(idealSize: CGSize, alignment: Alignment = .center) -> some View {
        modifier(ViewFrameSizeModifier(size: .ideal(idealSize), alignment: alignment))
    }
    
    func frame(minSize: CGSize, alignment: Alignment = .center) -> some View {
        modifier(ViewFrameSizeModifier(size: .minimum(minSize), alignment: alignment))
    }
    
    func frame(maxSize: CGSize, alignment: Alignment = .center) -> some View {
        modifier(ViewFrameSizeModifier(size: .maximum(maxSize), alignment: alignment))
    }
}
