//
//  ThemeToolbarButtonStyle.swift
//  SnapTheme
//
//  Created by Simon Nickel on 28.12.23.
//

import SwiftUI
import SnapCore

extension ButtonStyle where Self == ThemeToolbarButtonStyle {
	
	public static var themeNavbar: ThemeToolbarButtonStyle {
		ThemeToolbarButtonStyle(placement: .navigation, showTitle: true)
	}
	
	public static var themeNavbarIcon: ThemeToolbarButtonStyle {
		ThemeToolbarButtonStyle(placement: .navigation, showTitle: false)
	}
	
	public static var themeSidebarBottom: ThemeToolbarButtonStyle {
		ThemeToolbarButtonStyle(placement: .sidebarBottom, showTitle: true)
	}
	
}


// MARK: - ThemeToolbarButtonStyle

public struct ThemeToolbarButtonStyle: ButtonStyle {
	
	@Environment(\.theme) private var theme
	
	public init(placement: ThemeLabelStyleToolbar.Placement, showTitle: Bool) {
		self.placement = placement
		self.showTitle = showTitle
	}
	
	private let placement: ThemeLabelStyleToolbar.Placement
	private let showTitle: Bool
	
	public func makeBody(configuration: Configuration) -> some View {
		
		configuration.label
			.labelStyle(ThemeLabelStyleToolbar(placement: placement, showTitle: showTitle))
			.theme(surface: configuration.isPressed ? .overlayHighlightAccent : .interactiveForeground)
		
	}
	
}
