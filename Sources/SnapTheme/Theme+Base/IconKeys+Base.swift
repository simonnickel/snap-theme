//
//  IconKeys+Base.swift
//  SnapTheme
//
//  Created by Simon Nickel on 06.05.23.
//

import SwiftUI
	
public extension Theme.IconKey {
		
	static let allBaseKeys: [Theme.IconKey] = [
		// Generic Actions
		.close,
		.favorite,
		.edit,
		.delete,
		.settings,
		.warning,
		// Indicators
		.accessoryNavigation,
		.textFieldClear,
		.emptyScreenDecoration,
		.cardIndicatorSelected, .cardIndicatorEnabled, .cardIndicatorDisabled,
		// Toolbar
		.toolbarMore,
		.toolbarCreate,
	]
	
	
	// MARK: - Generic Actions
	
	/// Icon that represents a close action, e.g. for a sheet.
	static let close = Theme.IconKey("close", default: .system(name: "xmark.circle.fill"))
	
	/// Icon that represents a favorite interaction or state.
	static let favorite = Theme.IconKey("favorite", default: .system(name: "star"))
	
	/// Icon that represents an edit interaction.
	static let edit = Theme.IconKey("edit", default: .system(name: "square.and.pencil"))
	
	/// Icon that represents a delete action.
	static let delete = Theme.IconKey("delete", default: .system(name: "trash"))
	
	/// Icon that represents the settings screen.
	static let settings = Theme.IconKey("settings", default: .system(name: "gear"))
	
	/// Icon that indicates some kind of issue.
	static let warning = Theme.IconKey("warning", default: .system(name: "exclamationmark.triangle.fill"))
	
	
	// MARK: - Indicators
	
	/// Icon that indicates a navigation action.
	static let accessoryNavigation = Theme.IconKey("accessoryNavigation", default: .system(name: "chevron.forward"))
	
	/// Icon to use as a button to clear a `TextField`.
	static let textFieldClear = Theme.IconKey("textFieldClear", default: .system(name: "xmark.circle.fill"))
	
	/// Icon that decorates an empty screen.
	static let emptyScreenDecoration = Theme.IconKey("emptyScreenDecoration", default: .system(name: "figure.dance"))
	
	/// Icon on a card to indicate selected state.
	static let cardIndicatorSelected = Theme.IconKey("cardIndicatorSelected", default: .system(name: "checkmark.circle.fill"))
	
	/// Icon on a card to indicate enabled state.
	static let cardIndicatorEnabled = Theme.IconKey("cardIndicatorEnabled", default: .system(name: "record.circle")) // "circle.inset.filled"),
	
	/// Icon on a card to indicate disabled state.
	static let cardIndicatorDisabled = Theme.IconKey("cardIndicatorDisabled", default: .system(name: "circle"))
	
	
	// MARK: - Toolbar
	// Toolbar icons: Usually as .circle.fill, except toolbarMore.
	
	/// Icon for placement in toolbar that represents a set of additional actions.
	static let toolbarMore = Theme.IconKey("toolbarMore", default: .system(name: "ellipsis"))
	
	/// Icon for placement in toolbar that represents a create action.
	static let toolbarCreate = Theme.IconKey("toolbarCreate", default: .system(name: "plus.circle.fill"))
	
}
