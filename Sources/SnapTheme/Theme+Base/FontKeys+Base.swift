//
//  FontKeys+Base.swift
//  SnapTheme
//
//  Created by Simon Nickel on 10.03.23.
//

import SwiftUI

public extension Theme.FontKey {
		
	static let allBaseKeys: [Theme.FontKey] = [
		// Scene
		.sceneHeader, .sceneHeaderSubtitle, .sceneSectionHeader,
		// Text
		.textTitle, .textSubtitle, .textLabel, .textIcon, .textBlock, .textValue, .textFootnote,
		// Card
		.cardTitle, .cardSubtitle, .cardLabel, .cardIcon, .cardBlock, .cardValue, .cardFootnote, .cardIndicator,
		// List
		.listHeader, .listHeaderProminent, .listFooter, .listTitle, .listSubtitle, .listLabel, .listIcon, .listBlock, .listValue, .listFootnote, .listNavText, .listAccessoryNavigation,
		// Sidebar
		.sidebarTitle, .sidebarLabel, .sidebarLabelSelected,
		// Label
		.labelButtonPrimary, .labelButtonSecondary,
		// Toolbar
		.toolbarLabel, .toolbarIcon, .toolbarNavigationLabel, .toolbarNavigationIcon, .toolbarClose,
		// Controls
		.pickerLabel, .controlTextField, .controlTextFieldProminent,
	]
	
	
	// MARK: Scene
	
	/// Font for header of a Scene.
	static let sceneHeader = Theme.FontKey("sceneHeader", default: .definition(.init(size: 34, weight: .bold, textStyle: .largeTitle))) // iOS 16: UINavigationBar large title is SFUI-Bold 34
	static let sceneHeaderSubtitle = Theme.FontKey("sceneHeaderSubtitle", default: .definition(.init(size: 20, weight: .semibold, textStyle: .largeTitle)))
	static let sceneSectionHeader = Theme.FontKey("sceneSectionHeader", default: .definition(.init(size: 22, weight: .bold, textStyle: .title1)))
	
	
	// MARK: Text
	
	static let textTitle = Theme.FontKey("textTitle", default: .definition(.init(size: 16, weight: .semibold, textStyle: .title1)))
	static let textSubtitle = Theme.FontKey("textSubtitle", default: .definition(.init(size: 14, weight: .semibold)))
	static let textBlock = Theme.FontKey("textBlock", default: .definition(.init(size: 14, weight: .regular)))
	static let textLabel = Theme.FontKey("textLabel", default: .definition(.init(size: 12, weight: .semibold)))
	static let textIcon = Theme.FontKey("textIcon", default: .key(.textLabel))
	static let textValue = Theme.FontKey("textValue", default: .key(.textLabel))
	static let textFootnote = Theme.FontKey("textFootnote", default: .definition(.init(size: 12, weight: .regular)))
	
	
	// MARK: Card
	
	static let cardTitle = Theme.FontKey("cardTitle", default: .definition(.init(size: 18, weight: .semibold, textStyle: .title3)))
	static let cardSubtitle = Theme.FontKey("cardSubtitle", default: .definition(.init(size: 18, weight: .semibold, textStyle: .title3)))
	static let cardLabel = Theme.FontKey("cardLabel", default: .definition(.init(size: 15, weight: .medium)))
	static let cardIcon = Theme.FontKey("cardIcon", default: .definition(.init(size: 22, weight: .bold, textStyle: .title1)))
	static let cardBlock = Theme.FontKey("cardBlock", default: .definition(.init(size: 13, weight: .medium)))
	static let cardValue = Theme.FontKey("cardValue", default: .key(.cardIcon))
	static let cardFootnote = Theme.FontKey("cardFootnote", default: .key(.textFootnote))
	
	static let cardIndicator = Theme.FontKey("cardIndicator", default: .definition(.init(size: 24, weight: .bold, textStyle: .title1)))
	
	
	// MARK: List
	
	static let listTitle = Theme.FontKey("listTitle", default: .definition(.init(size: 17, weight: .semibold, textStyle: .title3)))
	static let listSubtitle = Theme.FontKey("listSubtitle", default: .definition(.init(size: 14, weight: .semibold, textStyle: .title3)))
	static let listLabel = Theme.FontKey("listLabel", default: .definition(.init(size: 17, weight: .regular))) // iOS 16: (size: 17, weight: .regular)
	static let listIcon = Theme.FontKey("listIcon", default: .key(.listLabel))
	static let listBlock = Theme.FontKey("listBlock", default: .definition(.init(size: 14, weight: .regular)))
	static let listValue = Theme.FontKey("listValue", default: .key(.listLabel))
	static let listFootnote = Theme.FontKey("listFootnote", default: .key(.textFootnote))
	
	/// Font for text in header of a list.
	static let listHeader = Theme.FontKey("listHeader", default: .definition(.init(size: 14, weight: .semibold))) // iOS 16: (size: 13, weight: .regular)
	
	/// Font for text in header of a list with bigger content.
	static let listHeaderProminent = Theme.FontKey("listHeaderProminent", default: .key(.sceneSectionHeader))
	
	/// Font for text in footer of a list.
	static let listFooter = Theme.FontKey("listFooter", default: .definition(.init(size: 13, weight: .regular))) // iOS 16: (size: 13, weight: .regular)
	
	/// Font for text in a list of `NavigationLink`s.
	static let listNavText = Theme.FontKey("listNavText", default: .definition(.init(size: 17, weight: .regular)))
	
	static let listAccessoryNavigation = Theme.FontKey("listAccessoryNavigation", default: .key(.listTitle))
	
	
	// MARK: Sidebar
	
	// Title - iOS 17: (size: 20, weight: .semibold), macOS 14: (size: 11, weight: .semibold)
	// Label - iOS 17: (size: 17, weight: .regular), macOS 14: (size: 13, weight: .regular)
#if os(macOS)
	static let sidebarTitle = Theme.FontKey("sidebarTitle", default: .definition(.init(size: 11, weight: .semibold)))
	static let sidebarLabel = Theme.FontKey("sidebarLabel", default: .definition(.init(size: 13, weight: .regular)))
	static let sidebarLabelSelected = Theme.FontKey("sidebarLabelSelected", default: .definition(.init(size: 13, weight: .semibold)))
#else
	static let sidebarTitle = Theme.FontKey("sidebarTitle", default: .definition(.init(size: 20, weight: .semibold)))
	static let sidebarLabel = Theme.FontKey("sidebarLabel", default: .definition(.init(size: 17, weight: .regular)))
	static let sidebarLabelSelected = Theme.FontKey("sidebarLabelSelected", default: .definition(.init(size: 17, weight: .semibold)))
#endif
	static let sidebarIcon = Theme.FontKey("sidebarIcon", default: .key(.sidebarLabel))
	static let sidebarIconSelected = Theme.FontKey("sidebarIconSelected", default: .key(.sidebarLabelSelected))
	
	
	// MARK: Label
	
	static let labelButtonPrimary = Theme.FontKey("labelButtonPrimary", default: .definition(.init(size: 18, weight: .semibold, textStyle: .title3)))
	static let labelButtonSecondary = Theme.FontKey("labelButtonSecondary", default: .key(.labelButtonPrimary))
	
	
	// MARK: Toolbar
	
	static let toolbarLabel = Theme.FontKey("toolbarLabel", default: .definition(.init(size: 17, weight: .semibold)))
	static let toolbarIcon = Theme.FontKey("toolbarIcon", default: .key(.toolbarLabel))
	
	static let toolbarNavigationLabel = Theme.FontKey("toolbarNavigationLabel", default: .key(.toolbarLabel))
	static let toolbarNavigationIcon = Theme.FontKey("toolbarNavigationIcon", default: .key(.toolbarIcon))
	
	static let toolbarClose = Theme.FontKey("toolbarNavigationLabel", default: .definition(.init(size: 30, weight: .semibold)))
	
	
	// MARK: Controls
	
	static let pickerLabel = Theme.FontKey("pickerLabel", default: .definition(.init(size: 14, weight: .regular)))
	
	static let controlTextField = Theme.FontKey("textField", default: .system)
	static let controlTextFieldProminent = Theme.FontKey("textField", default: .key(.sceneSectionHeader))
	
}
