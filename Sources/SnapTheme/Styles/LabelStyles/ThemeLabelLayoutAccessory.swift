//
//  ThemeLabelLayoutAccessory.swift
//	SnapTheme
//
//  Created by Simon Nickel on 12.01.24.
//

import SwiftUI

public struct ThemeLabelLayoutAccessory: LabelStyle {
	
	public func makeBody(configuration: Configuration) -> some View {
		ThemeHStack(spacing: .spacingElements) {
			configuration.title
			Spacer()
			configuration.icon
		}
	}
	
}


// MARK: - LabelStyle Extension

public extension LabelStyle where Self == ThemeLabelLayoutAccessory {
	
	static func themeLayoutAccessory() -> ThemeLabelLayoutAccessory {
		.init()
	}
	
}


// MARK: - Preview

#Preview {
	
	ThemePreviewContainer(.view) {
		
		Section {
			
			ThemeLabel(
				text: "LabelLayoutAccessory",
				icon: .accessoryNavigation,
				style: .themeLayoutAccessory()
			)
			
		} header: {
			ThemeSectionHeaderContainer {
				ThemeLabel(text: "LabelLayoutAccessory", style: .themeSectionHeader(prominent: true))
			}
		}
		
	}
	
}


