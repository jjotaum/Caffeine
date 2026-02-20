//
//  ViewModel.swift
//  Caffeine
//
//  Created by Jota Uribe on 26/08/23.
//

import Foundation
import Observation

/// Protocol describing basic structure of `Observable` View Models.
@available(iOS 17.0, macOS 14.0, watchOS 10.0, tvOS 17.0, *)
public protocol ViewModel: Observable {
    associatedtype Action
    func handle(_ action: Action)
}

@available(iOS, deprecated: 17.0, message: "Use ViewModel on iOS 17+")
@available(macOS, deprecated: 14.0, message: "Use ViewModel on macOS 14+")
@available(watchOS, deprecated: 10.0, message: "Use ViewModel on watchOS 10+")
@available(tvOS, deprecated: 17.0, message: "Use ViewModel on tvOS 17+")
/// Legacy protocol describing basic structure of `ObservableObject` View Models.
public protocol LegacyViewModel: ObservableObject {
    associatedtype Action
    func handle(_ action: Action)
}
