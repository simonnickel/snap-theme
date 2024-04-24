//
//  TextSurfaceKeys+Base.swift
//  SnapTheme
//
//  Created by Simon Nickel on 23.06.23.
//

import SwiftUI

public extension Theme.TextSurfaceKey {
	
	static var definitionsBase: [Theme.TextSurfaceKeyType : Theme.TextSurfaceValueType] {[
		
		// Text
		.textSubtitle: .color(.foregroundSecondary),
		.labelButtonPrimary: .color(.foregroundOnBackground),
		.labelButtonSecondary: .key(.accentForegroundInteractive),
		// List
		.listHeader: .color(.foregroundSecondary),
		.listFooter: .color(.foregroundSecondary),
		.listAccessoryNavigation: .color(.listAccessoryNavigation),
		// Sidebar
		.sidebarTitle: .platform(macOS: .color(.foregroundSecondary), other: .color(.foreground)),
		.sidebarLabelSelected: .color(.foregroundOnBackground),
		.sidebarIcon: .key(.accentForegroundInteractive),
		.sidebarIconSelected: .color(.foregroundOnBackground),
		
	]}
	
}
