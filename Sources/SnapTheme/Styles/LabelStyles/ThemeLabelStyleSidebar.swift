//
//  ThemeLabelStyleSidebar.swift
//  SnapTheme
//
//  Created by Simon Nickel on 20.09.23.
//

import SwiftUI

public struct ThemeLabelStyleSidebar: LabelStyle {
	
	@Environment(\.backgroundProminence) private var backgroundProminence
	
	public static let defaultIsSelected: Bool = false
	
	public init(isSelected: Bool = ThemeLabelStyleSidebar.defaultIsSelected) {
		self.isSelected = isSelected
	}
	
	private let isSelected: Bool
	
	public func makeBody(configuration: Configuration) -> some View {
		// TODO FB: BackgroundProminence alone does work on macOS, but not on iOS (reference: FB13310835).
		let shouldHighlight = isSelected || backgroundProminence == .increased
		Label {
			configuration.title
				.theme(text: shouldHighlight ? .sidebarLabelSelected : .sidebarLabel)
		} icon: {
			configuration.icon
				.theme(text: shouldHighlight ? .sidebarIconSelected : .sidebarIcon)
				// .imageScale(.large) gets scale from List automatically
		}
	}
	
}


// MARK: - LabelStyle Extension

public extension LabelStyle where Self == ThemeLabelStyleSidebar {
	
	static func themeSidebar(
		isSelected: Bool = ThemeLabelStyleSidebar.defaultIsSelected
	) -> ThemeLabelStyleSidebar {
		.init(isSelected: isSelected)
	}
	
}


// MARK: - Preview

#Preview {
	
	ThemePreviewContainer(.view) {
		
		Section {
			
			ThemeLabel(
				text: "LabelStyleSidebar",
				icon: .favorite,
				style: .themeSidebar()
			)
			
			ThemeLabel(
				text: "StyleSidebar selected",
				icon: .favorite,
				style: .themeSidebar(isSelected: true)
			)
			.theme(background: .interactive)
			
		} header: {
			ThemeSectionHeaderContainer {
				ThemeLabel(text: "LabelStyleSidebar", style: .themeSectionHeader(prominent: true))
			}
		}
		
		Section {
			
			ThemeLabel(
				text: "LabelStyleSidebar",
				style: .themeSidebar()
			)
			
			ThemeLabel(
				text: "StyleSidebar selected",
				style: .themeSidebar(isSelected: true)
			)
			.theme(background: .interactive)
			
		} header: {
			ThemeLabel(text: "Missing params", style: .themeSectionHeader(prominent: true))
		}
		
	}
	
}

