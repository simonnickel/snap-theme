//
//  ValueKeys+Base.swift
//  SnapTheme
//
//  Created by Simon Nickel on 25.04.23.
//

import SwiftUI

public extension Theme.NumberKey {
	
	static let allBaseKeys: [Theme.NumberKey] = [
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
	static let spacingSections = Theme.NumberKey("spacingSections", default: 32)
	
	/// Generic spacing between groups of elements.
	static let spacingGroups = Theme.NumberKey("spacingGroups", default: 16)
	
	/// Generic spacing between elements.
	static let spacingElements = Theme.NumberKey("spacingElements", default: 8)
	
	/// Generic spacing between lines.
	static let spacingLines = Theme.NumberKey("spacingLines", default: 4)
	
	/// Generic padding for a modal scene.
	static let paddingModal = Theme.NumberKey("paddingModal", default: 16)
	
	/// Padding for spacing of close button in modal scene.
	static let paddingModalCloseButton = Theme.NumberKey("paddingModalCloseButton", default: 10)
	
	/// Width of a stroke indicating a selection.
	static let strokeSelected = Theme.NumberKey("strokeSelected", default: 2)
	
	
	// MARK: - Corner Radius
	
	/// Corner radius for sheets.
	static let cornerRadiusSheet = Theme.NumberKey("cornerRadiusSheet", default: nil) // Uses system default
	
	/// Generic corner radius for an element.
	static let cornerRadiusElement = Theme.NumberKey("cornerRadiusElement", default: 6)
	
	
	// MARK: - Text
	
	/// Generic spacing between `.textHeader` and content.
	static let textSpacingHeader = Theme.NumberKey("textSpacingHeader", default: 10)
	
	/// Generic spacing between `.textTitle` and content.
	static let textSpacingTitle = Theme.NumberKey("textSpacingTitle", default: 8)
	
	
	// MARK: - Card
	
	/// Corner radius of the Card frame.
	static let cardCornerRadiusGround = Theme.NumberKey("cardCornerRadiusGround", default: 20)
	
	/// Corner radius of the Card frame.
	static let cardCornerRadiusFirst = Theme.NumberKey("cardCornerRadiusFirst", default: 8)
	
	/// Padding between Content and the Card frame.
	static let cardPadding = Theme.NumberKey("cardPadding", default: 12)
	
	/// Padding between the Indicator and the Card frame.
	/// Indicator padding should be a little less than content padding.
	static let cardPaddingIndicator = Theme.NumberKey("cardPaddingIndicator", default: 8)
	
	
	// MARK: - List
	
	/// Spacing between the title and content in a list.
	static let listSpacingTitle = Theme.NumberKey("listSpacingTitle", default: 4)
	
	/// Vertical Padding in a list row.
	static let listRowPaddingVertical = Theme.NumberKey("listRowPaddingVertical", default: 11)
	
	/// Horizontal Padding in a list row.
	static let listRowPaddingHorizontal = Theme.NumberKey("listRowPaddingHorizontal", default: 16) // TODO finetuning: Simulator and Preview use 20, while device uses 16 (tested with iPhone 13 Pro). Consider not using these paddings at all.
	
	/// Spacing between sections in `.insetGrouped`.
	static let listSpacingSections = Theme.NumberKey("listSpacingSections", default: 36) // iOS 17 spacing between sections in .insetGrouped.
	
	
	// MARK: - Sidebar
	
	static let sidebarMacOSBackgroundPaddingHorizontal = Theme.NumberKey("sidebarMacOSBackgroundPaddingHorizontal", default: 10)
	
	static let sidebarBackgroundCornerRadius = Theme.NumberKey("sidebarBackgroundCornerRadius", default: .platform(macOS: 5, other: 8))
	
	
	// MARK: - CTA Style: Button / Label
	
	/// Corner radius for the background of a button, see `ThemeButtonStyle`.
	static let buttonCornerRadius = Theme.NumberKey("buttonCTACornerRadius", default: 8)
	
	/// Vertical Padding for a label styled as a CTA, see `LabelStyleThemedTag`.
	static let labelCTAPaddingVertical = Theme.NumberKey("labelCTAPaddingVertical", default: 12)
	
	/// Horizontal Padding for a label styled as a CTA, see `LabelStyleThemedTag`.
	static let labelCTAPaddingHorizontal = Theme.NumberKey("labelCTAPaddingHorizontal", default: 16)
	
	
	// MARK: - Tag Style: Label
	
	/// Corner radius for the background of a label styled as a Tag, see `LabelStyleThemedTag`.
	static let labelTagCornerRadius = Theme.NumberKey("labelTagCornerRadius", default: 4)
	
	/// Vertical Padding for a label styled as a Tag, see `LabelStyleThemedTag`.
	static let labelTagPaddingVertical = Theme.NumberKey("labelTagPaddingVertical", default: 3)
	
	/// Horizontal Padding for a label styled as a Tag, see `LabelStyleThemedTag`.
	static let labelTagPaddingHorizontal = Theme.NumberKey("labelTagPaddingHorizontal", default: 8)
	
}
