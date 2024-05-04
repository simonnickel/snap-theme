//
//  Theme+NavigationBarAppearance.swift
//  SnapTheme
//
//  Created by Simon Nickel on 26.04.24.
//

import SwiftUI
import UIKit
import SnapCore

// TODO FB: SwiftUI should support styling of navigation bar.

extension Theme {
	
	struct ThemeNavigationBarAppearance: ViewModifier {
		
		@Environment(\.self) var environment
		@Environment(\.theme) private var theme
		
		public func body(content: Content) -> some View {
			return content
#if !os(macOS) // TODO macOS: Find a way to customize the macOS navigation title.
				.onAppear() {
					let standardAppearance = UINavigationBarAppearance()
					standardAppearance.configureWithDefaultBackground()
					
					let color = theme.color(for: .navigationBarTitle, in: environment)
					
					// TODO idea: Set font from theme. Needs to get UIFont from Font.
					// Converting Font to UIFont is a bit tricky. This will at least use fontDesignDefault of the Theme.
					// Only applied on app start.
					let font = UIFont.preferredFont(for: Theme.FontDefinition.TextStyle.headline.valueUIKit, weight: .semibold, design: theme.fontDesignDefault.valueUIFontDescriptor)
					let fontLarge = UIFont.preferredFont(for: Theme.FontDefinition.TextStyle.largeTitle.valueUIKit, weight: .bold, design: theme.fontDesignDefault.valueUIFontDescriptor)
					
					let attributes: [NSAttributedString.Key : Any] = [
						.foregroundColor: UIColor(color),
						.font: font,
					]
					let attributesLarge: [NSAttributedString.Key : Any] = [
						.foregroundColor: UIColor(color),
						.font: fontLarge,
					]
					standardAppearance.titleTextAttributes = attributes
					standardAppearance.largeTitleTextAttributes = attributesLarge
					
					UINavigationBar.appearance().standardAppearance = standardAppearance
				}
#endif
		}
	}
	
}
