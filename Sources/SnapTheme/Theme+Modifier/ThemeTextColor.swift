//
//  ThemeTextSurface.swift
//  SnapTheme
//
//  Created by Simon Nickel on 23.06.23.
//

import SwiftUI

public extension View {
	
	/// Applies font and color registered for `TextSurfaceKeyType aka FontKey` as defined in `Theme.fonts` and `Theme.textSurfaces`.
	/// - Parameters:
	///   - font: `TextSurfaceKeyType aka FontKey` key to use.
	/// - Returns: Modified View.
	func theme(text textSurfaceKey: Theme.TextSurfaceKeyType) -> some View {
		return self.modifier(Theme.ThemeTextSurface(key: textSurfaceKey))
	}

}


// MARK: - View Modifier

private extension Theme {
	
	/// View Modifier to apply the font by given `Theme.TextSurfaceKeyType` as defined in `Theme.fonts` and color assigned to the font in `Theme.textSurfaces`.
	/// - Font is scaled by DynamicType and the `.scale` value from the theme.
	struct ThemeTextSurface: ViewModifier {
		@Environment(\.theme) private var theme
		
		var key: Theme.TextSurfaceKeyType
		
		public func body(content: Content) -> some View {
			let surface = theme.textSurface(key)
			return content
				.themeScaledFont(key)
				.theme(surface: surface)
		}
	}
	
}


// MARK: - Preview

#Preview {
	
	ThemeVStack(spacing: .spacingGroups) {
		
		Text("Text Title")
			.theme(font: .textTitle)
			.theme(color: .accentPrimary)
		
		Text("Text Title")
			.theme(text: .textTitle)
			.theme(color: .accentPrimary)
		
		Text("Text Title")
			.theme(color: .accentPrimary)
			.theme(text: .textTitle)
		
	}
	
}
