//
//  ThemeLabelStyleListRow.swift
//	SnapTheme
//
//  Created by Simon Nickel on 22.09.23.
//

import SwiftUI

public struct ThemeLabelStyleListRow: LabelStyle {
	
	public static let defaultHighlightIcon: Bool = true
	
	public init(
		highlightIcon: Bool = ThemeLabelStyleListRow.defaultHighlightIcon
	) {
		self.highlightIcon = highlightIcon
	}
	
	private let highlightIcon: Bool
	
	public func makeBody(configuration: Configuration) -> some View {
		Label {
			configuration.title
				.theme(text: .listLabel)
		} icon: {
			configuration.icon
				//.imageScale(.large) gets scale from List automatically
				.if(highlightIcon) { view in
					view.surface(.accentForeground)
				}
				.theme(text: .listIcon)
		}
	}
	
}


// MARK: - LabelStyle Extension

public extension LabelStyle where Self == ThemeLabelStyleListRow {
	
	static func themeListRow(
		highlightIcon: Bool = ThemeLabelStyleListRow.defaultHighlightIcon
	) -> ThemeLabelStyleListRow {
		.init(highlightIcon: highlightIcon)
	}
	
}


// MARK: - Preview

#Preview {
	
	List {
		
		Section {
			ThemeLabel(
				text: "ListRow Default",
				icon: .favorite,
				style: .themeListRow()
			)
			ThemeLabel(
				text: "ListRow no Icon highlight",
				icon: .favorite,
				style: .themeListRow(highlightIcon: !ThemeLabelStyleListRow.defaultHighlightIcon)
			)
		} header: {
			ThemeLabel(text: "Options", style: .themeSectionHeader(prominent: true))
		}
		
		Section {
			ThemeLabel(
				text: "ThemeLabelStyleListRow",
				style: .themeListRow()
			)
		} header: {
			ThemeLabel(text: "Missing params", style: .themeSectionHeader(prominent: true))
		}
		
	}
	
}

