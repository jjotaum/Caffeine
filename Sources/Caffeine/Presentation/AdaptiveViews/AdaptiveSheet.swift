//
//  AdaptiveSheet.swift
//  Caffeine
//
//  Created by Jota Uribe on 20/02/26.
//

#if os(iOS) || os(macOS)
import SwiftUI

/// A modifier to display `content` as `sheet` or `inspector` depending on `horizontalSizeClass`.
@available(iOS 17.0, macOS 14.0, *)
public struct AdaptiveSheet<SheetContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    let sheetContent: () -> SheetContent
    
    public init(isPresented: Binding<Bool>, sheetContent: @escaping () -> SheetContent) {
        _isPresented = isPresented
        self.sheetContent = sheetContent
    }
    
    public func body(content: Content) -> some View {
        AdaptiveContainer {
            content.sheet(isPresented: $isPresented, content: sheetContent)
        } extended: {
            content.inspector(isPresented: $isPresented, content: sheetContent)
        }

    }
}

@available(iOS 17.0, macOS 14.0, *)
public extension View {
    func adaptiveSheet<Content: View>(isPresented: Binding<Bool>, content: @escaping () -> Content) -> some View {
        modifier(AdaptiveSheet(isPresented: isPresented, sheetContent: content))
    }
}
#endif
