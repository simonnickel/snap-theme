//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

public extension Theme.NumberKey {
	
	static let allBaseKeys: [Theme.NumberKey] = [
		.spacingSections, .spacingGroups, .spacingElements, .spacingLines, .paddingModal, .paddingModalCloseButton, .strokeSelected,
		.cornerRadiusSheet, .cornerRadiusElement,
		.spacingTextHeader, .spacingTextTitle, .spacingTextBlock,
		.cardCornerRadiusGround, .cardCornerRadiusFirst, .cardPadding, .cardPaddingIndicator,
		.listSpacingTitle, .listRowPaddingVertical, .listRowPaddingHorizontal,
		.sidebarMacOSBackgroundPaddingHorizontal, .sidebarBackgroundCornerRadius,
		.buttonCornerRadius, .labelButtonPaddingVertical, .labelButtonPaddingHorizontal,
		.labelTagCornerRadius, .labelTagPaddingVertical, .labelTagPaddingHorizontal,
	]
	
	
	// MARK: - Generic
	
	/// Generic spacing between sections.
	static let spacingSections = Theme.NumberKey("spacingSections", default: .value(32))
	
	/// Generic spacing between groups of elements.
	static let spacingGroups = Theme.NumberKey("spacingGroups", default: .value(16))
	
	/// Generic spacing between elements.
	static let spacingElements = Theme.NumberKey("spacingElements", default: .value(8))
	
	/// Generic spacing between lines.
	static let spacingLines = Theme.NumberKey("spacingLines", default: .value(4))
	
	/// Generic padding for a modal scene.
	static let paddingModal = Theme.NumberKey("paddingModal", default: .value(16))
	
	/// Padding for spacing of close button in a modal scene.
	static let paddingModalCloseButton = Theme.NumberKey("paddingModalCloseButton", default: .value(10))
	
	/// Width of a stroke indicating a selection.
	static let strokeSelected = Theme.NumberKey("strokeSelected", default: .value(2))
	
	
	// MARK: - Corner Radius
	
	/// Corner radius for sheets.
	static let cornerRadiusSheet = Theme.NumberKey("cornerRadiusSheet", default: .system) // Uses system default
	
	/// Generic corner radius for an element. Make sure to check for surrounding corners to fit the curve, see `.cardCornerRadiusGround / First`.
	static let cornerRadiusElement = Theme.NumberKey("cornerRadiusElement", default: .key(.cardCornerRadiusFirst))
	
	
	// MARK: - Text
	
	/// Generic spacing between `.textHeader` and content.
	static let spacingTextHeader = Theme.NumberKey("spacingTextHeader", default: .value(12))
	
	/// Generic spacing between `.textTitle` and content.
	static let spacingTextTitle = Theme.NumberKey("spacingTextTitle", default: .key(.spacingElements))
	
	/// Generic spacing between `.textBlock` and `.textBlock`.
	static let spacingTextBlock = Theme.NumberKey("spacingTextBlock", default: .key(.spacingElements))
	
	
	// MARK: - Card
	
	/// Corner radius of the Card frame.
	static let cardCornerRadiusGround = Theme.NumberKey("cardCornerRadiusGround", default: .value(20))
	
	/// Corner radius of the Card frame.
	static let cardCornerRadiusFirst = Theme.NumberKey("cardCornerRadiusFirst", default: .value(8))
	
	/// Padding between Content and the Card frame.
	static let cardPadding = Theme.NumberKey("cardPadding", default: .value(12))
	
	/// Padding between the Indicator and the Card frame.
	/// Indicator padding should be a little less than content padding.
	static let cardPaddingIndicator = Theme.NumberKey("cardPaddingIndicator", default: .value(8))
	
	
	// MARK: - List
	
	/// Spacing between the title and content in a list.
	static let listSpacingTitle = Theme.NumberKey("listSpacingTitle", default: .value(4))
	
	/// Vertical Padding in a list row.
	static let listRowPaddingVertical = Theme.NumberKey("listRowPaddingVertical", default: .value(11))
	
	/// Horizontal Padding in a list row.
	static let listRowPaddingHorizontal = Theme.NumberKey("listRowPaddingHorizontal", default: .value(16)) // TODO finetuning: Simulator and Preview use 20, while device uses 16 (tested with iPhone 13 Pro). Consider not using these paddings at all.
	
	/// Spacing between sections in `.insetGrouped`.
	static let listSpacingSections = Theme.NumberKey("listSpacingSections", default: .value(36)) // iOS 17 spacing between sections in .insetGrouped.
	
	
	// MARK: - Sidebar
	
	static let sidebarMacOSBackgroundPaddingHorizontal = Theme.NumberKey("sidebarMacOSBackgroundPaddingHorizontal", default: .value(10))
	
	static let sidebarBackgroundCornerRadius = Theme.NumberKey("sidebarBackgroundCornerRadius", default: .platform(macOS: .value(5), other: .value(8)))
	
	
	// MARK: - Button Label
	
	/// Corner radius for the background of a button, see `ThemeButtonStyle`.
	static let buttonCornerRadius = Theme.NumberKey("buttonCornerRadius", default: .key(.cardCornerRadiusFirst))
	
	/// Vertical Padding for a label used in a Button, see `ThemeLabelStyleButtonPrimary/Secondary`.
	static let labelButtonPaddingVertical = Theme.NumberKey("labelButtonPaddingVertical", default: .value(12))
	
	/// Horizontal Padding for a label styled as a Button, see `ThemeLabelStyleButtonPrimary/Secondary`.
	static let labelButtonPaddingHorizontal = Theme.NumberKey("labelButtonPaddingHorizontal", default: .value(16))
	
	/// The duration the button should be highlighted. 
	static let durationDelayButtonHighlight = Theme.NumberKey("durationDelayButtonHighlight", default: .value(0.2))
	
	
	// MARK: - Tag Label
	
	/// Corner radius for the background of a label styled as a Tag, see `ThemeLabelStyleTag`.
	static let labelTagCornerRadius = Theme.NumberKey("labelTagCornerRadius", default: .value(4))
	
	/// Vertical Padding for a label styled as a Tag, see `ThemeLabelStyleTag`.
	static let labelTagPaddingVertical = Theme.NumberKey("labelTagPaddingVertical", default: .value(3))
	
	/// Horizontal Padding for a label styled as a Tag, see `ThemeLabelStyleTag`.
	static let labelTagPaddingHorizontal = Theme.NumberKey("labelTagPaddingHorizontal", default: .value(8))
	
	
	// MARK: - Scale
	
	static let interfaceScaleTiny = Theme.NumberKey("interfaceScaleTiny", default: .value(0.75))
	static let interfaceScaleSmall = Theme.NumberKey("interfaceScaleSmall", default: .value(0.9))
	static let interfaceScaleMedium = Theme.NumberKey("interfaceScaleMedium", default: .value(1))
	static let interfaceScaleLarge = Theme.NumberKey("interfaceScaleLarge", default: .value(1.1))
	static let interfaceScaleHuge = Theme.NumberKey("interfaceScaleHuge", default: .value(1.25))
	
}
