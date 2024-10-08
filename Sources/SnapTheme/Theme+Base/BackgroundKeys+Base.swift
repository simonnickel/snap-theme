//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import Foundation

public extension Theme.BackgroundKey {
	
	static let allBaseKeys: [Theme.BackgroundKey] = [
		.screen, .content, .contentSecondary, .accent, .interactive, 
		.bar, .barNavigation, .barBottom, .barTab, .sidebar,
		.buttonPrimary, .buttonSecondary, .buttonToolbar, buttonDestructive,
		.tag
	]
	
	
	// MARK: Screen
	
	/// Screen background.
	/// macOS does use .system to allow list scroll edge behaviour where windowBar disappears (FB13322408). 
	static let screen = Theme.BackgroundKey("screen", default: .platform(macOS: .system, other: .surface(.color(.backgroundScreen))))
	
	/// Generic bar background definition.
	static let bar = Theme.BackgroundKey("bar", default: .system) // .platform(macOS: .system, other: .surface(.material(.bar)))
	/// Background of .navigationBar (iOS) or windowToolbar (macOS).
	static let barNavigation = Theme.BackgroundKey("barNavigation", default: .key(.bar))
	/// Background of .bottomBar.
	static let barBottom = Theme.BackgroundKey("barBottom", default: .key(.bar))
	/// Background of .tabBar.
	static let barTab = Theme.BackgroundKey("barTab", default: .key(.bar))
	
	// FB13324686 - SwiftUI: NavigationSplitView sidebar in overlay does not use Material as background
	/// Background of sidebar.
	static let sidebar = Theme.BackgroundKey("sidebar", default: .system)
	
	
	// MARK: Content
	
	/// Background of content elements.
	static let content = Theme.BackgroundKey("content", default: .surface(.color(.backgroundContent), highlight: .overlayHighlightContent))
	
	/// Background of content on top of content.
	static let contentSecondary = Theme.BackgroundKey("contentSecondary", default: .surface(.color(.backgroundContentSecondary), highlight: .overlayHighlightContent))
	
	/// Background of content elements with visual focus.
	static let accent = Theme.BackgroundKey("accent", default: .surface(.accentBackground, highlight: .overlayHighlightAccent))
	
	/// Background of content elements with visual focus.
	static let accentSecondary = Theme.BackgroundKey("accent", default: .surface(.color(.accentComplimentary), highlight: .overlayHighlightAccent))
	
	/// Background of interactive elements.
	static let interactive = Theme.BackgroundKey("interactive", default: .surface(.accentBackgroundInteractive, highlight: .overlayHighlightAccent))
	
	
	// MARK: Buttons
	
	/// Background of primary button.
	static let buttonPrimary = Theme.BackgroundKey("buttonPrimary", default:
			.key(.interactive)
	)
	
	/// Background of secondary button.
	static let buttonSecondary = Theme.BackgroundKey("buttonSecondary", default:
			.surface(.color(.clear), highlight: .overlayHighlightContent)
	)
	
	/// Background of toolbar button.
	static let buttonToolbar = Theme.BackgroundKey("buttonToolbar", default:
			.surface(.color(.clear), highlight: .overlayHighlightContent)
	)
	
	/// Background of desctructive button.
	static let buttonDestructive = Theme.BackgroundKey("buttonDestructive", default:
			.surface(.color(.destructive), highlight: .overlayHighlightPush)
	)
	
	
	// MARK: Others
	
	/// TODO FB13475990: Currently not in use, see ThemeNavLinkSidebarRow.
	static let sidebarSelected = Theme.BackgroundKey("sidebarSelected", default: .key(.interactive))
	
	static let tag = Theme.BackgroundKey("tag", default: .key(.contentSecondary))
	
}
