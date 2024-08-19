//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

/// A `VStack` wrapper to configure spacing with value of `Theme.NumberKey`.
public struct ThemeVStack<Content>: View where Content : View {
	
	@Environment(\.theme) private var theme
	@ScaledMetric private var scaleFactor: CGFloat = 1
	
	public init(alignment: HorizontalAlignment = .center, spacing: Theme.NumberKey? = nil, @ViewBuilder content: @escaping () -> Content) {
		self.alignment = alignment
		self.spacing = spacing
		self.content = content
	}
	
	private let alignment: HorizontalAlignment
	private let spacing: Theme.NumberKey?
	private let content: () -> Content
	
	public var body: some View {	
		
		VStack(
			alignment: alignment,
			spacing: {
				if let spacing {
					theme.number(spacing, scaled: scaleFactor)
				} else { 0 }
			}(),
			content: content
		)
		
	}
	
}


// MARK: - Preview

#Preview {
	
	ThemePreviewContainer(.view) {
		
		Section {
			
			HStack {
				
				VStack {
					Rectangle()
					Rectangle()
				}
				
				ThemeVStack {
					Rectangle()
					Rectangle()
				}
				
				ThemeVStack(spacing: .spacingElements) {
					Rectangle()
					Rectangle()
				}
				
			}
			
		} header: {
			ThemeSectionHeaderContainer {
				ThemeLabel(text: "ThemeVStack", style: .themeSectionHeader(prominent: true))
			}
		}
		
	}
	
}

