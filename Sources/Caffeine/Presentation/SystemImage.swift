//
//  SystemImage.swift
//  Caffeine
//
//  Created by Jota Uribe on 7/10/23.
//

import Foundation

#if canImport(AppKit)
import AppKit.NSImage

public typealias SystemImage = NSImage
#endif

#if canImport(UIKit)
import UIKit.UIImage

public typealias SystemImage = UIImage
#endif
