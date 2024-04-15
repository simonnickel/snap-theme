//
//  ValueKeys+Base.swift
//  SnapTheme
//
//  Created by Simon Nickel on 25.04.23.
//

import SwiftUI

public extension Theme.ValueKey {
	
	static let allBaseKeys: [Theme.ValueKey] = [
		.spacingSections, .spacingGroups, .spacingElements, .paddingModal, .paddingModalCloseButton,
		.cornerRadiusSheet, .cornerRadiusElement,
		.textSpacingHeader, .textSpacingTitle,
		.cardCornerRadiusGround, .cardCornerRadiusFirst, .cardPadding, .cardPaddingIndicator,
		.listSpacingTitle, .listRowPaddingVertical, .listRowPaddingHorizontal,
		.sidebarMacOSBackgroundPaddingHorizontal, .sidebarBackgroundCornerRadius,
		.buttonCornerRadius, .labelCTAPaddingVertical, .labelCTAPaddingHorizontal,
		.labelTagCornerRadius, .labelTagPaddingVertical, .labelTagPaddingHorizontal,
	]
	
	
	// MARK: - Generic
	
	/// Generic spacing between sections.
	static let spacingSections = Theme.ValueKey("spacingSections", default: 32)
	
	/// Generic spacing between groups of elements.
	static let spacingGroups = Theme.ValueKey("spacingGroups", default: 16)
	
	/// Generic spacing between elements.
	static let spacingElements = Theme.ValueKey("spacingElements", default: 8)
	
	/// Generic spacing between lines.
	static let spacingLines = Theme.ValueKey("spacingLines", default: 4)
	
	/// Generic padding for a modal scene.
	static let paddingModal = Theme.ValueKey("paddingModal", default: 16)
	
	/// Padding for spacing of close button in modal scene.
	static let paddingModalCloseButton = Theme.ValueKey("paddingModalCloseButton", default: 10)
	
	/// Width of a stroke indicating a selection.
	static let strokeSelected = Theme.ValueKey("strokeSelected", default: 2)
	
	
	// MARK: - Corner Radius
	
	/// Corner radius for sheets.
	static let cornerRadiusSheet = Theme.ValueKey("cornerRadiusSheet", default: nil) // Uses system default
	
	/// Generic corner radius for an element.
	static let cornerRadiusElement = Theme.ValueKey("cornerRadiusElement", default: 6)
	
	
	// MARK: - Text
	
	/// Generic spacing between `.textHeader` and content.
	static let textSpacingHeader = Theme.ValueKey("textSpacingHeader", default: 10)
	
	/// Generic spacing between `.textTitle` and content.
	static let textSpacingTitle = Theme.ValueKey("textSpacingTitle", default: 8)
	
	
	// MARK: - Card
	
	/// Corner radius of the Card frame.
	static let cardCornerRadiusGround = Theme.ValueKey("cardCornerRadiusGround", default: 20)
	
	/// Corner radius of the Card frame.
	static let cardCornerRadiusFirst = Theme.ValueKey("cardCornerRadiusFirst", default: 8)
	
	/// Padding between Content and the Card frame.
	static let cardPadding = Theme.ValueKey("cardPadding", default: 12)
	
	/// Padding between the Indicator and the Card frame.
	/// Indicator padding should be a little less than content padding.
	static let cardPaddingIndicator = Theme.ValueKey("cardPaddingIndicator", default: 8)
	
	
	// MARK: - List
	
	/// Spacing between the title and content in a list.
	static let listSpacingTitle = Theme.ValueKey("listSpacingTitle", default: 4)
	
	/// Vertical Padding in a list row.
	static let listRowPaddingVertical = Theme.ValueKey("listRowPaddingVertical", default: 11)
	
	/// Horizontal Padding in a list row.
	static let listRowPaddingHorizontal = Theme.ValueKey("listRowPaddingHorizontal", default: 16) // TODO finetuning: Simulator and Preview use 20, while device uses 16 (tested with iPhone 13 Pro). Consider not using these paddings at all.
	
	/// Spacing between sections in `.insetGrouped`.
	static let listSpacingSections = Theme.ValueKey("listSpacingSections", default: 36) // iOS 17 spacing between sections in .insetGrouped.
	
	
	// MARK: - Sidebar
	
	static let sidebarMacOSBackgroundPaddingHorizontal = Theme.ValueKey("sidebarMacOSBackgroundPaddingHorizontal", default: 10)
	
	static let sidebarBackgroundCornerRadius = Theme.ValueKey("sidebarBackgroundCornerRadius", default: .platform(macOS: 5, other: 8))
	
	
	// MARK: - CTA Style: Button / Label
	
	/// Corner radius for the background of a button, see `ThemeButtonStyle`.
	static let buttonCornerRadius = Theme.ValueKey("buttonCTACornerRadius", default: 8)
	
	/// Vertical Padding for a label styled as a CTA, see `LabelStyleThemedTag`.
	static let labelCTAPaddingVertical = Theme.ValueKey("labelCTAPaddingVertical", default: 12)
	
	/// Horizontal Padding for a label styled as a CTA, see `LabelStyleThemedTag`.
	static let labelCTAPaddingHorizontal = Theme.ValueKey("labelCTAPaddingHorizontal", default: 16)
	
	
	// MARK: - Tag Style: Label
	
	/// Corner radius for the background of a label styled as a Tag, see `LabelStyleThemedTag`.
	static let labelTagCornerRadius = Theme.ValueKey("labelTagCornerRadius", default: 4)
	
	/// Vertical Padding for a label styled as a Tag, see `LabelStyleThemedTag`.
	static let labelTagPaddingVertical = Theme.ValueKey("labelTagPaddingVertical", default: 3)
	
	/// Horizontal Padding for a label styled as a Tag, see `LabelStyleThemedTag`.
	static let labelTagPaddingHorizontal = Theme.ValueKey("labelTagPaddingHorizontal", default: 8)
	
}
