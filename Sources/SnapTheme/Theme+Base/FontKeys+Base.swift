//
//  FontKeys+Base.swift
//  SnapTheme
//
//  Created by Simon Nickel on 10.03.23.
//

import SwiftUI

public extension Theme.FontKey {
		
	static let allBaseKeys: [Theme.FontKey] = [
		// Screen
		.screenHeader, .screenHeaderSubtitle, .screenSectionHeader,
		// Text
		.textTitle, .textSubtitle, .textBlock, .textLabel, .textIcon, .textValue, .textFootnote,
		// Card
		.cardTitle, .cardSubtitle, .cardIcon, .cardValue, .cardLabel, .cardBlock, .cardFootnote, .cardIndicator,
		// List
		.listTitle, .listSubtitle, .listLabel, .listIcon, .listValue, .listBlock, .listFootnote, .listAccessoryNavigation,
		.listHeader, .listHeaderProminent, .listFooter, .listAccessoryNavigation,
		// Sidebar
		.sidebarTitle, .sidebarLabel, .sidebarLabelSelected, .sidebarIcon, .sidebarIconSelected,
		// Label
		.labelButtonPrimary, .labelButtonSecondary,
		// Toolbar
		.toolbarLabel, .toolbarIcon, .toolbarNavigationLabel, .toolbarNavigationIcon, .toolbarClose,
		// Controls
		.controlTextField, .controlTextFieldProminent,
	]
	
	
	// MARK: Screen
	
	/// Font for header of a screen.
	static let screenHeader = Theme.FontKey("screenHeader", default: .definition(.init(size: 34, weight: .bold, textStyle: .largeTitle))) // iOS 16: UINavigationBar large title is SFUI-Bold 34
	
	/// Font for subtitle of a `screenHeader`.
	static let screenHeaderSubtitle = Theme.FontKey("screenHeaderSubtitle", default: .definition(.init(size: 20, weight: .semibold, textStyle: .largeTitle)))
	
	/// Font for a header of a section of a screen.
	static let screenSectionHeader = Theme.FontKey("screenSectionHeader", default: .definition(.init(size: 22, weight: .bold, textStyle: .title1)))
	
	
	// MARK: Text
	
	static let textTitle = Theme.FontKey("textTitle", default: .definition(.init(size: 16, weight: .semibold, textStyle: .title1)))
	static let textSubtitle = Theme.FontKey("textSubtitle", default: .definition(.init(size: 14, weight: .semibold)))
	static let textBlock = Theme.FontKey("textBlock", default: .definition(.init(size: 14, weight: .regular)))
	static let textLabel = Theme.FontKey("textLabel", default: .definition(.init(size: 12, weight: .semibold)))
	static let textIcon = Theme.FontKey("textIcon", default: .key(.textLabel))
	static let textValue = Theme.FontKey("textValue", default: .key(.textLabel))
	static let textFootnote = Theme.FontKey("textFootnote", default: .definition(.init(size: 12, weight: .regular)))
	
	
	// MARK: Card
	
	static let cardTitle = Theme.FontKey("cardTitle", default: .definition(.init(size: 22, weight: .semibold, textStyle: .title3)))
	static let cardSubtitle = Theme.FontKey("cardSubtitle", default: .definition(.init(size: 18, weight: .semibold, textStyle: .title3)))
	static let cardIcon = Theme.FontKey("cardIcon", default: .key(.cardTitle))
	static let cardValue = Theme.FontKey("cardValue", default: .key(.cardTitle))
	static let cardLabel = Theme.FontKey("cardLabel", default: .definition(.init(size: 16, weight: .medium)))
	static let cardBlock = Theme.FontKey("cardBlock", default: .definition(.init(size: 13, weight: .medium)))
	static let cardFootnote = Theme.FontKey("cardFootnote", default: .key(.textFootnote))
	
	static let cardIndicator = Theme.FontKey("cardIndicator", default: .definition(.init(size: 24, weight: .bold, textStyle: .title1)))
	
	
	// MARK: List
	
	static let listTitle = Theme.FontKey("listTitle", default: .definition(.init(size: 17, weight: .semibold, textStyle: .title3)))
	static let listSubtitle = Theme.FontKey("listSubtitle", default: .definition(.init(size: 14, weight: .semibold, textStyle: .title3)))
	static let listLabel = Theme.FontKey("listLabel", default: .definition(.init(size: 16, weight: .medium))) // iOS 16: (size: 17, weight: .regular)
	static let listIcon = Theme.FontKey("listIcon", default: .key(.listLabel))
	static let listValue = Theme.FontKey("listValue", default: .key(.listLabel))
	static let listBlock = Theme.FontKey("listBlock", default: .key(.textBlock))
	static let listFootnote = Theme.FontKey("listFootnote", default: .key(.textFootnote))
	
	/// Font for text in header of a list.
	static let listHeader = Theme.FontKey("listHeader", default: .definition(.init(size: 14, weight: .semibold))) // iOS 16: (size: 13, weight: .regular)
	
	/// Font for text in header of a list with bigger content.
	static let listHeaderProminent = Theme.FontKey("listHeaderProminent", default: .key(.screenSectionHeader))
	
	/// Font for text in footer of a list.
	static let listFooter = Theme.FontKey("listFooter", default: .definition(.init(size: 13, weight: .regular))) // iOS 16: (size: 13, weight: .regular)
	
	/// Font for a list accesory indicating a navigation action.
	static let listAccessoryNavigation = Theme.FontKey("listAccessoryNavigation", default: .key(.listTitle))
	
	
	// MARK: Sidebar
	
	// Title - iOS 17: (size: 20, weight: .semibold), macOS 14: (size: 11, weight: .semibold)
	// Label - iOS 17: (size: 17, weight: .regular), macOS 14: (size: 13, weight: .regular)
	
	/// Font for section title in the sidebar.
	static let sidebarTitle = Theme.FontKey("sidebarTitle", default: .platform(
		macOS: .definition(.init(size: 11, weight: .semibold)),
		other: .definition(.init(size: 20, weight: .semibold))
	))
	
	/// Font for the label of a sidebar item.
	static let sidebarLabel = Theme.FontKey("sidebarLabel", default: .platform(
		macOS: .definition(.init(size: 13, weight: .regular)),
		other: .definition(.init(size: 17, weight: .regular))
	))
	
	/// Font for the label of a selected sidebar item.
	static let sidebarLabelSelected = Theme.FontKey("sidebarLabelSelected", default: .platform(
		macOS: .definition(.init(size: 13, weight: .semibold)),
		other: .definition(.init(size: 17, weight: .semibold))
	))

	/// Font for the icon of a sidebar item.
	static let sidebarIcon = Theme.FontKey("sidebarIcon", default: .key(.sidebarLabel))
	/// Font for the icon of a selected sidebar item.
	static let sidebarIconSelected = Theme.FontKey("sidebarIconSelected", default: .key(.sidebarLabelSelected))
	
	
	// MARK: Label
	
	/// Font for the label of a primary button.
	static let labelButtonPrimary = Theme.FontKey("labelButtonPrimary", default: .definition(.init(size: 18, weight: .semibold, textStyle: .title3)))
	
	/// Font for the label of a secondary button.
	static let labelButtonSecondary = Theme.FontKey("labelButtonSecondary", default: .key(.labelButtonPrimary))
	
	
	// MARK: Toolbar
	
	/// Font for the label of an item in a toolbar.
	static let toolbarLabel = Theme.FontKey("toolbarLabel", default: .definition(.init(size: 17, weight: .semibold)))
	
	/// Font for the icon of an item in a toolbar.
	static let toolbarIcon = Theme.FontKey("toolbarIcon", default: .key(.toolbarLabel))
	
	/// Font for the label of a navigation item in a toolbar.
	static let toolbarNavigationLabel = Theme.FontKey("toolbarNavigationLabel", default: .key(.toolbarLabel))
	
	/// Font for the icon of a navigation item in a toolbar.
	static let toolbarNavigationIcon = Theme.FontKey("toolbarNavigationIcon", default: .key(.toolbarIcon))
	
	/// Font for the close icon for a toolbar.
	static let toolbarClose = Theme.FontKey("toolbarNavigationLabel", default: .definition(.init(size: 30, weight: .semibold)))
	
	
	// MARK: Controls
	
	/// Font for the content of a `TextField`.
	static let controlTextField = Theme.FontKey("textField", default: .system)
	
	/// Font for the content of a promonent `TextField`, e.g. when it's the main input or the title of the screen.
	static let controlTextFieldProminent = Theme.FontKey("textField", default: .key(.screenSectionHeader))
	
}
