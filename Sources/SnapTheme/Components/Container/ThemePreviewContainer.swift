//
//  ThemePreviewContainer.swift
//  SnapTheme
//
//  Created by Simon Nickel on 22.09.23.
//

import SwiftUI
import SnapCore

public struct ThemePreviewContainer<Content: View>: View {
	
	public enum Style {
		case scene, view
	}
	
	public init(
		_ style: Style,
		title: String? = nil,
		background: Theme.BackgroundKey? = .content,
		alignment: Alignment = .center,
		padding: Theme.NumberKey? = .paddingModal,
		theme: Theme = .base,
		@ViewBuilder content: @escaping () -> Content
	) {
		self.style = style
		self.title = title
		self.background = background
		self.alignment = alignment
		self.padding = padding
		self.theme = theme
		self.content = content
	}

	private let style: Style
	private let title: String?
	private let background: Theme.BackgroundKey?
	private let alignment: Alignment
	private let padding: Theme.NumberKey?
	private let theme: Theme
	private let content: () -> Content
	
	public var body: some View {
		NavigationStack {
			ThemeScene(title: title) {
				
				switch style {
						
					case .scene:
						
						ThemeVStack(spacing: .spacingGroups) {
							content()
								.frame(maxWidth: .infinity, alignment: alignment)
						}
						
					case .view:
						
						ThemeElement(
							shape: .rectangle(.cardCornerRadiusGround),
							padding: padding,
							background: background
						) {
							
							ThemeVStack(spacing: .spacingGroups) {
								content()
									.frame(maxWidth: .infinity, alignment: alignment)
							}
							
						}
						
				}
				
			}
			.environment(\.theme, theme)
		}
	}
	
}


// MARK: - Preview

#Preview {
		
	VStack {
		
		ThemePreviewContainer(.scene, title: "Preview") {
			
			Text("Test")
			Text("Test")
			Text("Test")
			Text("Test")
			
		}
		
		ThemePreviewContainer(.view, title: "Preview") {
			
			Text("Test")
			Text("Test")
			Text("Test")
			Text("Test")
			
		}
		
	}
	.background(.black)
}
