//
//  CGSize+Constants.swift
//  Caffeine
//
//  Created by Jota Uribe on 1/11/24.
//

import struct CoreGraphics.CGFloat
import struct CoreGraphics.CGSize

/// Mainly intended for icons size usage
public extension CGSize {
    /// 16x16
    static let small: CGSize = .init(width: 16, height: 16)
    /// 24x24
    static let regular: CGSize = .init(width: 24, height: 24)
    /// 32x32
    static let large: CGSize = .init(width: 32, height: 32)
}

public extension CGSize {
    static let infinity = CGSize(width: CGFloat.infinity, height: CGFloat.infinity)
}
