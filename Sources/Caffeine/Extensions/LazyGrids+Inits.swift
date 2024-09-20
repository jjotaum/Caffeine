//
//  LazyGrids+Inits.swift
//  Caffeine
//
//  Created by Jota Uribe on 1/03/24.
//

import SwiftUI

public extension LazyHGrid {
    init(numberOfRows: Int,
         with size: GridItem.Size = .flexible(minimum: .zero, maximum: .infinity),
         alignment: VerticalAlignment = .top,
         spacing: CGFloat = .zero,
         pinnedViews: PinnedScrollableViews = [],
         @ViewBuilder content: () -> Content) {
        let gridItem: GridItem = .init(size, spacing: spacing, alignment: .top)
        self.init(rows: .init(repeating: gridItem, count: numberOfRows),
                  alignment: alignment,
                  spacing: spacing,
                  pinnedViews: pinnedViews,
                  content: content)
    }
}

public extension LazyVGrid {
    init(numberOfColumns: Int,
         with size: GridItem.Size = .flexible(minimum: .zero, maximum: .infinity),
         alignment: HorizontalAlignment = .center,
         spacing: CGFloat = .zero,
         pinnedViews: PinnedScrollableViews = [],
         @ViewBuilder content: () -> Content) {
        let gridItem: GridItem = .init(size, spacing: spacing, alignment: .top)
        self.init(columns: .init(repeating: gridItem, count: numberOfColumns),
                  alignment: alignment,
                  spacing: spacing,
                  pinnedViews: pinnedViews,
                  content: content)
    }
}
