//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

public struct ThemeLabelStyleButtonPrimary: LabelStyle {
	
	public init() {}
	
	public func makeBody(configuration: Configuration) -> some View {
		ThemeHStack(spacing: .labelButtonPaddingHorizontal) {
			configuration.icon
				.imageScale(.medium)
			configuration.title
		}
		.theme(text: .labelButtonPrimary)
		.theme(padding: .labelButtonPaddingHorizontal, .horizontal)
		.theme(padding: .labelButtonPaddingVertical, .vertical)
	}
	
}


// MARK: - LabelStyle Extension

public extension LabelStyle where Self == ThemeLabelStyleButtonPrimary {
	
	static var themeButtonPrimary: ThemeLabelStyleButtonPrimary {
		.init()
	}
	
}


// MARK: - Preview

#Preview {
	
	ThemePreviewContainer(.view) {
		
		Section {
			
			ThemeLabel(
				text: "Theme CTA",
				icon: .favorite,
				style: .themeButtonPrimary
			)
			.theme(background: .interactive)
			
			ThemeLabel(
				text: "No Background",
				icon: .favorite,
				style: .themeButtonSecondary
			)
			
		} header: {
			ThemeSectionHeaderContainer {
				ThemeLabel(text: "Options", style: .themeSectionHeader(prominent: true))
			}
		}
		
		Section {
			ThemeLabel(
				text: "ThemeLabelStyleListRow",
				style: .themeButtonPrimary
			)
		} header: {
			ThemeSectionHeaderContainer {
				ThemeLabel(text: "Missing params", style: .themeSectionHeader(prominent: true))
			}
		}
		
	}
	
}
