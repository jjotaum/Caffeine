//
//  Setting.swift
//  Caffeine
//
//  Created by Jota Uribe on 30/01/25.
//

import Foundation

public protocol Setting: Hashable, LabelDisplayable {
    static var key: String { get }
    static var localizedDescription: LocalizedStringResource { get }
}
