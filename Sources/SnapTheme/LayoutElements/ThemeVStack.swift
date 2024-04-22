//
//  ThemeVStack.swift
//  SnapTheme
//
//  Created by Simon Nickel on 25.09.23.
//

import SwiftUI

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
					theme.value(spacing, scaled: scaleFactor)
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

