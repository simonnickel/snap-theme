//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
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
				.if(theme.fontFamilyDefault == .system, transform: { view in
					// Applying font design would break other font families.
					view.fontDesign(theme.fontDesignDefault.value)
				})
				.environment(\.theme, theme)
			// UIKit Appearance
			// TODO FB: Does not update on theme change, only applied on app start.
				.modifier(Theme.ThemeNavigationBarAppearance())
				.modifier(Theme.ThemeTabBarAppearance())
		}
	}
	
}
