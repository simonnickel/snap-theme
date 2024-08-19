//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

/// A `LazyHGrid` wrapper to configure spacing with value of `Theme.NumberKey`.
public struct ThemeLazyHGrid<Content>: View where Content : View {
	
	@Environment(\.theme) private var theme
	@ScaledMetric private var scaleFactor: CGFloat = 1
	
	public init(rows: [GridItem], alignment: VerticalAlignment = .center, spacing: Theme.NumberKey? = nil, pinnedViews: PinnedScrollableViews = .init(), @ViewBuilder content: @escaping () -> Content) {
		self.rows = rows
		self.alignment = alignment
		self.spacing = spacing
		self.pinnedViews = pinnedViews
		self.content = content
	}
	
	private let rows: [GridItem]
	private let alignment: VerticalAlignment
	private let spacing: Theme.NumberKey?
	private let pinnedViews: PinnedScrollableViews
	private let content: () -> Content
	
	public var body: some View {
		
		LazyHGrid(
			rows: rows,
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
			
			VStack {
				
				LazyHGrid(
					rows: [GridItem(.fixed(10))]
				) {
					Rectangle()
					Rectangle()
				}
				
				ThemeLazyHGrid(
					rows: [GridItem(.fixed(10))]
				) {
					Rectangle()
					Rectangle()
				}
				
				ThemeLazyHGrid(
					rows: [GridItem(.fixed(10))],
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


