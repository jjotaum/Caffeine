//
//  Image+SystemImage.swift
//  Caffeine
//
//  Created by Jota Uribe on 11/04/24.
//

import SwiftUI

public extension Image {
    init(systemImage: SystemImage) {
#if canImport(AppKit)
        self.init(nsImage: systemImage)
#endif

#if canImport(UIKit)
        self.init(uiImage: systemImage)
#endif
    }
}
