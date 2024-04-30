//
//  ThemeLabelStyleSectionHeader.swift
//  SnapTheme
//
//  Created by Simon Nickel on 06.09.23.
//

import SwiftUI
import SnapCore

public struct ThemeLabelStyleSectionHeader: LabelStyle {
	
	@Environment(\.theme) private var theme
	
	public static let defaultTextCase: Text.Case? = nil
	public static let defaultProminent: Bool = false
	
	public init(
		textCase: Text.Case? = ThemeLabelStyleSectionHeader.defaultTextCase,
		prominent: Bool = ThemeLabelStyleSectionHeader.defaultProminent
	) {
		self.textCase = textCase
		self.prominent = prominent
	}
	
	private let textCase: Text.Case?
	private let prominent: Bool
	
	public func makeBody(configuration: Configuration) -> some View {
		Label {
			configuration.title
				.textCase(textCase ?? .none)
		} icon: {
			configuration.icon
				.imageScale(prominent ? .large : .medium)
		}
		.theme(text: prominent ? .listHeaderProminent : .listHeader)
	}
	
}


// MARK: - LabelStyle Extension

public extension LabelStyle where Self == ThemeLabelStyleSectionHeader {
	
	static func themeSectionHeader(
		textCase: Text.Case? = ThemeLabelStyleSectionHeader.defaultTextCase,
		prominent: Bool = ThemeLabelStyleSectionHeader.defaultProminent
	) -> ThemeLabelStyleSectionHeader {
		.init(textCase: textCase, prominent: prominent)
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
				style: .themeSectionHeader(textCase: .uppercase)
			)
		}
		
		Section { Text("List") } header: {
			ThemeLabel(
				text: "Theme Icon Label",
				icon: .favorite,
				style: .themeSectionHeader()
			)
		}
		
		Section { Text("List") } header: {
			ThemeLabel(
				text: "Theme Icon Label",
				style: .themeSectionHeader(textCase: .uppercase, prominent: true)
			)
		}

		Section { Text("List") } header: {
			ThemeLabel(
				text: "Theme Icon Label",
				style: .themeSectionHeader(prominent: true)
			)
		}
		
		Section { Text("List") } header: {
			ThemeLabel(
				text: "Theme Icon Label",
				icon: .favorite,
				style: .themeSectionHeader(textCase: .uppercase, prominent: true)
			)
		}
		
		Section { Text("List") } header: {
			ThemeLabel(
				text: "Theme Icon Label",
				icon: .favorite,
				style: .themeSectionHeader(prominent: true)
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
			.labelStyle(.themeSectionHeader())
		}
		
	}
	
}
