//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
#if !os(macOS)
import UIKit
#endif
import SnapCore

// TODO FB: SwiftUI should support styling of tab bar.

extension Theme {
	
	struct ThemeTabBarAppearance: ViewModifier {
		
		@Environment(\.self) var environment
		@Environment(\.theme) private var theme
		
		public func body(content: Content) -> some View {
			return content
#if !os(macOS) // TODO macOS
				.onAppear() {
					
					
					// TODO idea: Set font from theme. Needs to get UIFont from Font.
					// Converting Font to UIFont is a bit tricky. This will at least use fontDesignDefault of the Theme.
					
					// Only applied on app start.
					// .caption2 is actually larger than default, but there is no fitting TextStyle (iOS 17: 10 medium).
					let font = UIFont.preferredFont(for: Theme.FontDefinition.TextStyle.caption2.valueUIKit, weight: .medium, design: theme.fontDesignDefault.valueUIFontDescriptor)
					
					let attributesNormal: [NSAttributedString.Key : Any] = [
						.font: font,
					]
					let attributesSelected: [NSAttributedString.Key : Any] = [
						.font: font,
					]

					UITabBarItem.appearance().setTitleTextAttributes(attributesNormal, for: .normal)
					UITabBarItem.appearance().setTitleTextAttributes(attributesSelected, for: .selected)
				}
#endif
		}
	}
	
}

