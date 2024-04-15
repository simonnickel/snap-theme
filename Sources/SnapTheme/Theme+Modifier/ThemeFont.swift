//
//  ThemeFont.swift
//  SnapTheme
//
//  Created by Simon Nickel on 27.04.23.
//

import SwiftUI

public extension View {
	
	/// Apply **scaled** font registered for `FontKey`.
	/// - Parameters:
	///   - font: `FontKey` to apply as `.font`.
	/// - Returns: Modified View.
	func theme(font: Theme.FontKey) -> some View {
		return self.modifier(Theme.ThemeFont(font: font))
	}

}


// MARK: - View Modifier

private extension Theme {
	
	/// View Modifier to apply the font registered for `FontKey` from the theme in environment as `.font`
	/// - Scaled by DynamicType and the `.scale` value from the theme.
	struct ThemeFont: ViewModifier {
		@Environment(\.theme) private var theme
		
		var font: Theme.FontKey
		
		public func body(content: Content) -> some View {
			return content
				.themeScaledFont(font)
		}
	}
	
}


// MARK: - Preview

#Preview {
	
	ThemeVStack(spacing: .spacingGroups) {
		
		Text("Text Title")
			.theme(font: .textTitle)
			.theme(color: .accentColor)
		
		Text("Text Title")
			.theme(text: .textTitle)
			.theme(color: .accentColor)
		
		Text("Text Title")
			.theme(color: .accentColor)
			.theme(text: .textTitle)
		
	}
	
}
