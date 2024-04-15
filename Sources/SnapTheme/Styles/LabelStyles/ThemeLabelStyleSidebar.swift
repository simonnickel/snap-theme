//
//  ThemeLabelStyleSidebar.swift
//  SnapTheme
//
//  Created by Simon Nickel on 20.09.23.
//

import SwiftUI

public struct ThemeLabelStyleSidebar: LabelStyle {
	
	public static let defaultIsSelected: Bool = false
	
	public init(isSelected: Bool = ThemeLabelStyleSidebar.defaultIsSelected) {
		self.isSelected = isSelected
	}
	
	private let isSelected: Bool
	
	public func makeBody(configuration: Configuration) -> some View {
		Label {
			configuration.title
				.theme(text: isSelected ? .sidebarLabelSelected : .sidebarLabel)
		} icon: {
			configuration.icon
				.theme(text: isSelected ? .sidebarIconSelected : .sidebarIcon)
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

