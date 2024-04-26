//
//  Theme+NavigationBarAppearance.swift
//  SnapTheme
//
//  Created by Simon Nickel on 26.04.24.
//

import SwiftUI
import UIKit

// TODO FB: SwiftUI should support styling of navigation bar.

extension Theme {
	
	struct ThemeNavigationBarAppearance: ViewModifier {
		
		@Environment(\.self) var environment
		@Environment(\.theme) private var theme
		
		public func body(content: Content) -> some View {
			return content
#if !os(macOS)
				.onAppear() {
					let standardAppearance = UINavigationBarAppearance()
					standardAppearance.configureWithDefaultBackground()
					
					let color = theme.color(for: .navigationTitle, in: environment)
					
					// TODO idea: Set font from theme. Needs to get UIFont from Font.
					// Converting Font to UIFont is a bit tricky. This will at least use fontDesignDefault of the Theme.
					// Only applied on app start.
					let font = UIFont.preferredFont(for: .largeTitle, weight: .bold, design: theme.fontDesignDefault.valueUIFontDescriptor)
					
					let attributes: [NSAttributedString.Key : Any] = [
						.foregroundColor: UIColor(color),
						.font: font,
					]
					standardAppearance.titleTextAttributes = attributes
					standardAppearance.largeTitleTextAttributes = attributes
					
					UINavigationBar.appearance().standardAppearance = standardAppearance
				}
#endif
		}
	}
	
}


// TODO: This does not belong here!
extension UIFont {
	static func preferredFont(for style: UIFont.TextStyle, weight: UIFont.Weight, design: UIFontDescriptor.SystemDesign = .rounded) -> UIFont {
		let defaultFont = UIFont.preferredFont(forTextStyle: style)
		var fontDescriptor = defaultFont.fontDescriptor
		
		// Customizing weight
		fontDescriptor = fontDescriptor.addingAttributes([
			UIFontDescriptor.AttributeName.traits: [
				UIFontDescriptor.TraitKey.weight: weight.rawValue
			]
		])
		
		// Customizing design
		if let descriptor = fontDescriptor.withDesign(design) {
			fontDescriptor = descriptor
		}
		
		// Setup the font to be auto-scalable
		let metrics = UIFontMetrics(forTextStyle: style)
		return metrics.scaledFont(for: UIFont(descriptor: fontDescriptor, size: defaultFont.pointSize))
	}
}
