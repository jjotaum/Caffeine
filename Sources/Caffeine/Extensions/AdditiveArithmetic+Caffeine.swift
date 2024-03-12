//
//  AdditiveArithmetic+Caffeine.swift
//  Caffeine
//
//  Created by Jota Uribe on 14/07/23.
//

import Foundation

public extension AdditiveArithmetic where Self : ExpressibleByIntegerLiteral {
    @inlinable static var one: Self { 1 }
}

public extension AdditiveArithmetic where Self : ExpressibleByFloatLiteral {
    @inlinable static var oneHalf: Self { 0.5 }
}
