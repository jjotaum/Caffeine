//
//  AdditiveArithmetic+Constants.swift
//  Caffeine
//
//  Created by Jota Uribe on 14/07/23.
//

import Foundation

public extension AdditiveArithmetic where Self : ExpressibleByIntegerLiteral {
    @inlinable static var one: Self { 1 }
    @inlinable static var two: Self { 2 }
    @inlinable static var three: Self { 3 }
    @inlinable static var four: Self { 4 }
    @inlinable static var five: Self { 5 }
    @inlinable static var six: Self { 6 }
    @inlinable static var seven: Self { 7 }
    @inlinable static var eight: Self { 8 }
    @inlinable static var nine: Self { 9 }
    @inlinable static var ten: Self { 10 }
}

public extension AdditiveArithmetic where Self : ExpressibleByFloatLiteral {
    @inlinable static var oneHalf: Self { 0.5 }
    /// Default animation duration (0.35)
    @inlinable static var defaultAnimationDuration: Self { 0.35 }
}
