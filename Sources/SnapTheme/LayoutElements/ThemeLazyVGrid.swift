//
//  ThemeLazyVGrid.swift
//  SnapTheme
//
//  Created by Simon Nickel on 09.01.24.
//

import SwiftUI

/// A `LazyVGrid` wrapper to configure spacing with value of `Theme.NumberKey`.
public struct ThemeLazyVGrid<Content>: View where Content : View {
	
	@Environment(\.theme) private var theme
	@ScaledMetric private var scaleFactor: CGFloat = 1
	
	public init(columns: [GridItem], alignment: HorizontalAlignment = .center, spacing: Theme.NumberKey? = nil, pinnedViews: PinnedScrollableViews = .init(), @ViewBuilder content: @escaping () -> Content) {
		self.columns = columns
		self.alignment = alignment
		self.spacing = spacing
		self.pinnedViews = pinnedViews
		self.content = content
	}
	
	private let columns: [GridItem]
	private let alignment: HorizontalAlignment
	private let spacing: Theme.NumberKey?
	private let pinnedViews: PinnedScrollableViews
	private let content: () -> Content
	
	public var body: some View {
		
		LazyVGrid(
			columns: columns,
			alignment: alignment,
			spacing: { 
				if let spacing {
					theme.number(spacing, scaled: scaleFactor)
				} else { 0 }
			}(),
			pinnedViews: pinnedViews,
			content: content
		)
		
	}
	
}


// MARK: - Preview

#Preview {
	
	ThemePreviewContainer(.view) {
		
		Section {
			
			HStack {
				
				LazyVGrid(
					columns: [GridItem(.fixed(10))]
				) {
					Rectangle()
					Rectangle()
				}
				
				ThemeLazyVGrid(
					columns: [GridItem(.fixed(10))]
				) {
					Rectangle()
					Rectangle()
				}
				
				ThemeLazyVGrid(
					columns: [GridItem(.fixed(10))],
					spacing: .spacingElements
				) {
					Rectangle()
					Rectangle()
				}
				
			}
			
		} header: {
			ThemeSectionHeaderContainer {
				ThemeLabel(text: "ThemeLazyVGrid", style: .themeSectionHeader(prominent: true))
			}
		}
		
	}
	
}

