//
//  ThemeLabelStyleSidebarSectionHeader.swift
//	SnapTheme
//
//  Created by Simon Nickel on 23.09.23.
//

import SwiftUI
import SnapCore

public struct ThemeLabelStyleSidebarSectionHeader: LabelStyle {
	
	@Environment(\.theme) private var theme
	
	public static let defaultTextCase: Text.Case? = nil
	
	public init(
		textCase: Text.Case? = ThemeLabelStyleSidebarSectionHeader.defaultTextCase
	) {
		self.textCase = textCase
	}
	
	private let textCase: Text.Case?
	
	public func makeBody(configuration: Configuration) -> some View {
		Label {
			configuration.title
				.textCase(textCase ?? .none)
		} icon: {
			configuration.icon
				.imageScale(.large)
		}
		.theme(text: .sidebarTitle)
	}
	
}


// MARK: - LabelStyle Extension

public extension LabelStyle where Self == ThemeLabelStyleSidebarSectionHeader {
	
	static func themeSidebarSectionHeader(
		textCase: Text.Case? = ThemeLabelStyleSidebarSectionHeader.defaultTextCase
	) -> ThemeLabelStyleSidebarSectionHeader {
		.init(textCase: textCase)
	}
	
}


// MARK: - Preview

#Preview {
	
	List {
		
		Section { Text("List") } header: {
			ThemeLabel(
				text: "Theme Icon Label",
				style: .themeSidebarSectionHeader(textCase: .uppercase)
			)
		}

		Section { Text("List") } header: {
			ThemeLabel(
				text: "Theme Icon Label",
				style: .themeSidebarSectionHeader()
			)
		}
		
		Section { Text("List") } header: {
			ThemeLabel(
				text: "Theme Icon Label",
				icon: .favorite,
				style: .themeSidebarSectionHeader(textCase: .uppercase)
			)
		}
		
		Section { Text("List") } header: {
			ThemeLabel(
				text: "Theme Icon Label",
				icon: .favorite,
				style: .themeSidebarSectionHeader()
			)
		}
		
		
		// Just an example on how to combine with other content than just a ThemeLabel.
		Section { Text("List") } header: {
			Label {
				HStack {
					Circle()
						.frame(width: 30, height: 30)
					VStack(alignment: .leading) {
						Text("Test")
							.theme(text: .cardTitle)
						Text("normal Label")
						Text("normal Label")
					}
				}
			} icon: {
				Rectangle()
					.frame(width: 30, height: 30)
			}
			.labelStyle(.themeSidebarSectionHeader())
		}
		
	}
	
}

