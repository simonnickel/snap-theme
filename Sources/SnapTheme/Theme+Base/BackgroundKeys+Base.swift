//
//  BackgroundKeys+Base.swift
//  SnapTheme
//
//  Created by Simon Nickel on 30.10.23.
//

import Foundation

public extension Theme.BackgroundKey {
	
	static let allBaseKeys: [Theme.BackgroundKey] = [
		.scene, .content, .contentSecondary, .accent, .interactive, 
		.bar, .barNavigation, .barBottom, .barTab, .sidebar,
		.buttonPrimary, .buttonSecondary, .buttonToolbar, buttonDestructive,
		.tag
	]
	
	
	// MARK: Scene
	
	/// Scene background.
	/// macOS does use .system to allow list scroll edge behaviour where windowBar disappears (FB13322408). 
	static let scene = Theme.BackgroundKey("scene", default: .platform(macOS: .system, other: .surface(.color(.background))))
	
	static let bar = Theme.BackgroundKey("bar", default: .system)
	static let barNavigation = Theme.BackgroundKey("barNavigation", default: .key(.bar))
	static let barBottom = Theme.BackgroundKey("barBottom", default: .key(.bar))
	static let barTab = Theme.BackgroundKey("barTab", default: .key(.bar))
	
	// Make sure to check macOS behavior: .platform(macOS: .system, other: .surface(.material(.bar)))
	
	// FB13324686 - SwiftUI: NavigationSplitView sidebar in overlay does not use Material as background
	static let sidebar = Theme.BackgroundKey("sidebar", default: .system)
	
	
	// MARK: Content
	
	static let content = Theme.BackgroundKey("content", default: .surface(.color(.backgroundContent), highlight: .overlayHighlightContent))
	
	static let contentSecondary = Theme.BackgroundKey("contentSecondary", default: .surface(.color(.backgroundContentSecondary), highlight: .overlayHighlightContent))
	
	static let accent = Theme.BackgroundKey("contentAccent", default: .surface(.accentBackground, highlight: .overlayHighlightAccent))
	
	static let interactive = Theme.BackgroundKey("interactive", default: .surface(.interactiveBackground, highlight: .overlayHighlightAccent))
	
	
	// MARK: Buttons
	
	static let buttonPrimary = Theme.BackgroundKey("buttonPrimary", default:
			.key(.interactive)
	)
	
	static let buttonSecondary = Theme.BackgroundKey("buttonSecondary", default:
			.surface(.color(.clear), highlight: .overlayHighlightContent)
	)
	
	static let buttonToolbar = Theme.BackgroundKey("buttonToolbar", default:
			.surface(.color(.clear), highlight: .overlayHighlightContent)
	)
	
	static let buttonDestructive = Theme.BackgroundKey("buttonDestructive", default:
			.surface(.color(.destructive), highlight: .overlayHighlightPush)
	)
	
	
	// MARK: Others
	
	static let sidebarSelected = Theme.BackgroundKey("sidebarSelected", default: .key(.interactive))
	
	static let tag = Theme.BackgroundKey("tag", default: .key(.contentSecondary))
	
}
