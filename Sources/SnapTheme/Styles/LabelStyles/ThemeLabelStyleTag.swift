//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

public struct ThemeLabelStyleTag: LabelStyle {
		
	@Environment(\.theme) private var theme
	
	public static let defaultFont: Theme.FontKey = .textLabel
	public static let defaultColor: Theme.ColorKey = .foreground
	public static let defaultBackground: Theme.BackgroundKey = .tag
	
	public init(
		font: Theme.FontKey = ThemeLabelStyleTag.defaultFont,
		color: Theme.ColorKey = ThemeLabelStyleTag.defaultColor,
		background: Theme.BackgroundKey = ThemeLabelStyleTag.defaultBackground,
		selected: Bool = false
	) {
		self.font = font
		self.color = color
		self.background = background
		self.selected = selected
	}
	
	public let font: Theme.FontKey
	public let color: Theme.ColorKey
	public let background: Theme.BackgroundKey
	public let selected: Bool
	
	public func makeBody(configuration: Configuration) -> some View {
		ThemeElement(
			shape: .rectangle(.labelTagCornerRadius),
			color: color,
			background: background,
			highlighted: selected
		) {
			Label {
				configuration.title
			} icon: {
				configuration.icon
					.imageScale(.medium)
			}
			.theme(font: font)
			.theme(padding: .labelTagPaddingHorizontal, .horizontal)
			.theme(padding: .labelTagPaddingVertical, .vertical)
		}
	}
	
}


// MARK: - LabelStyle Extension

public extension LabelStyle where Self == ThemeLabelStyleTag {
	
	static func themeTag(
		color: Theme.ColorKey = ThemeLabelStyleTag.defaultColor,
		background: Theme.BackgroundKey = ThemeLabelStyleTag.defaultBackground,
		selected: Bool = false
	) -> ThemeLabelStyleTag {
		.init(color: color, background: background, selected: selected)
	}
	
}


// MARK: - Preview

#Preview {
	
	ThemePreviewContainer(.view) {
		
		Section {
			ThemeLabel(
				text: "ThemeLabelStyleTag",
				icon: .favorite,
				style: .themeTag()
			)
			
			ThemeLabel(
				text: "ThemeLabelStyleTag, selected",
				icon: .favorite,
				style: .themeTag(selected: true)
			)
			
			HStack {
				ThemeLabel(text: "ThemeLabelStyleTag")
					.labelStyle(.themeTag())
			}
		} header: {
			ThemeSectionHeaderContainer {
				ThemeLabel(text: "Options", style: .themeSectionHeader(prominent: true))
			}
		}
		
		Section {
			ThemeLabel(
				text: "ThemeLabelStyleListRow",
				style: .themeTag()
			)
		} header: {
			ThemeSectionHeaderContainer {
				ThemeLabel(text: "Missing params", style: .themeSectionHeader(prominent: true))
			}
		}
			
	}
	
}
