//
//  ThemeHStack.swift
//  SnapTheme
//
//  Created by Simon Nickel on 25.09.23.
//

import SwiftUI

public struct ThemeHStack<Content>: View where Content : View {
	
	@Environment(\.theme) private var theme
	@ScaledMetric private var scaleFactor: CGFloat = 1
	
	public init(alignment: VerticalAlignment = .center, spacing: Theme.NumberKey? = nil, @ViewBuilder content: @escaping () -> Content) {
		self.alignment = alignment
		self.spacing = spacing
		self.content = content
	}
	
	private let alignment: VerticalAlignment
	private let spacing: Theme.NumberKey?
	private let content: () -> Content
	
	public var body: some View {
		
		HStack(
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
				Rectangle()
				Rectangle()
			}
			
			ThemeHStack {
				Rectangle()
				Rectangle()
			}
			
			ThemeHStack(spacing: .spacingElements) {
				Rectangle()
				Rectangle()
			}
			
		} header: {
			ThemeSectionHeaderContainer {
				ThemeLabel(text: "ThemeHStack", style: .themeSectionHeader(prominent: true))
			}
		}
		
	}
	
}

