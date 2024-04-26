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
					
					// TODO: Set font from theme. Needs to get UIFont from Font.
					// TODO: Color does not get adjusted on DarkMode.
					let color = theme.color(for: .navigationTitle, in: environment).getPlatformSpecific(in: environment)
					let attributes: [NSAttributedString.Key : Any] = [
						.foregroundColor: color,
					]
					standardAppearance.titleTextAttributes = attributes
					standardAppearance.largeTitleTextAttributes = attributes
					
					UINavigationBar.appearance().standardAppearance = standardAppearance
				}
#endif
		}
	}
	
}
