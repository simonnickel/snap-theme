//
//  Theme+ScaledFont.swift
//  SnapTheme
//
//  Created by Simon Nickel on 13.10.23.
//

import SwiftUI

internal extension View {
	
	/// View Modifier applies font registered by the given key to the view.
	///
	/// The font is scaled by `dynamicType` and the configured scale of the theme: `Theme.scale`.
	/// - Parameter key: Key of the font to use.
	/// - Returns: The modified view with font applied.
	func themeScaledFont(_ key: Theme.FontKey?) -> some View {
		return self.modifier(Theme.FontDefinitionUnwrapper(key: key))
	}
	
}


// MARK: - View Modifier

internal extension Theme {
	
	/// Gathers `Theme.FontDefinition` from current theme, to create ScaledMetric.
	struct FontDefinitionUnwrapper: ViewModifier {
		@Environment(\.theme) private var theme
		
		let key: Theme.FontKey?
		
		public func body(content: Content) -> some View {
			guard let definition = theme.fontDefinition(for: key) else { return AnyView(content) }
			
			return AnyView(content
				.modifier(Theme.ScaledFont(key: key, size: definition.size, textStyle: definition.textStyle.value)))
		}
	}
	
	struct ScaledFont: ViewModifier {
		@Environment(\.theme) private var theme
		
		let key: Theme.FontKey?
		private let scaled: ScaledMetric<Double>
		
		init(key: Theme.FontKey?, size: CGFloat, textStyle: Font.TextStyle) {
			self.key = key
			self.scaled = ScaledMetric(wrappedValue: size, relativeTo: textStyle)
		}
		
		public func body(content: Content) -> some View {
			let font = theme.font(key, sizeOverride: scaled.wrappedValue * theme.scale)
			return content
				.font(font)
		}
	}
	
}
