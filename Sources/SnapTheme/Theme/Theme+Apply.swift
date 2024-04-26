//
//  Theme+Apply.swift
//  SnapTheme
//
//  Created by Simon Nickel on 22.04.24.
//

import SwiftUI

public extension View {
	
	/// Apply the `Theme `to the view. Sets it as the environment value for `\.theme` and  applies generic values like `.tint(.accentColor)`.
	func theme(apply theme: Theme) -> some View  {
		return self.modifier(Theme.ThemeApplyModifier(theme: theme))
	}
	
}

public extension Theme {
	
	struct ThemeApplyModifier: ViewModifier {
		
		let theme: Theme
		
		public func body(content: Content) -> some View {
			content
				.theme(tint: .accentPrimary)
				.fontDesign(theme.fontDesignDefault.value)
				.environment(\.theme, theme)
		}
	}
	
}
