//
//  Setting.swift
//  Caffeine
//
//  Created by Jota Uribe on 30/01/25.
//

import Foundation

@available(iOS 16, *)
@available(macOS 13, *)
@available(tvOS 16, *)
@available(watchOS 9, *)
public protocol Setting: Hashable, LabelDisplayable {
    static var key: String { get }
    static var localizedDescription: LocalizedStringResource { get }
}
