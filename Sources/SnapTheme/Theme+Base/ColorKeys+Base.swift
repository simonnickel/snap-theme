//
//  ColorKeys+Base.swift
//  SnapTheme
//
//  Created by Simon Nickel on 10.03.23.
//

import SwiftUI

// TODO finetuning: Adjustments for Dark Mode
// TODO finetuning: Adjustments for High Contrast
// TODO finetuning: Adjustments for Elevated State -> https://blog.eidinger.info/uiuserinterfacelevel-in-swiftui
// TODO macOS: Handle UIKit definitions	
		
public extension Theme.ColorKey {
		
	static let allBaseKeys: [Theme.ColorKey] = [
		// Generic
		.clear, .white, .black,
		// Background
		.background, .backgroundContent, .backgroundContentSecondary,
		// Foreground
		.foreground, .foregroundSecondary, .foregroundDisabled, .foregroundOnBackground, .foregroundOnLightBackground,
		// Accent
		.accentColorBase, .accentColors, .accentColor, .accentComplimentary, .accentComplementary,
		// Controls
		.placeholder,
		// Others
		.destructive, .listAccessoryNavigation,
		.debugAssetReplacement,
		
	]
	
	
	// MARK: - Generic
	
	static let clear = Theme.ColorKey("clear", default: .color(.clear))
	static let white = Theme.ColorKey("clear", default: .color(.white))
	static let black = Theme.ColorKey("clear", default: .color(.black))
	
	
	// MARK: - Background
	
	/// Scene background.
	/// TODO finetuning: Should respect elevated presentation as in a sheet.
	/// See https://blog.eidinger.info/uiuserinterfacelevel-in-swiftui
	/// Also keep in mind: iPad apps should have a non black background in SplitView in dark mode.
	static let background = Theme.ColorKey("background", default: .color(.systemGroupedBackground))
	
	/// Content Background.
	static let backgroundContent = Theme.ColorKey("backgroundContent", default: .color(.secondarySystemGroupedBackground))
	
	/// Background of content on top of content.
	static let backgroundContentSecondary = Theme.ColorKey("backgroundContentSecondary", default: .color(.tertiarySystemGroupedBackground))
	
	
	// MARK: - Foreground
	
	/// Color of text on `.backgroundContent`.
	static let foreground = Theme.ColorKey("foreground", default: .color(.label))
	
	/// Color of secondary text on `.backgroundContent`.
	static let foregroundSecondary = Theme.ColorKey("foregroundSecondary", default: .color(.secondaryLabel))
	
	/// Color of disabled text on `.backgroundContent`.
	static let foregroundDisabled = Theme.ColorKey("foregroundDisabled", default: .color(.secondaryLabel))
	
	/// Color of text on colored background.
	static let foregroundOnBackground = Theme.ColorKey("foregroundOnBackground", default: .color(.white))
	
	/// Color of text on colored background.
	static let foregroundOnLightBackground = Theme.ColorKey("foregroundOnLightBackground", default: .color(.black))
	
	
	// MARK: - Accent
	
	/// Default accent color.
	static let accentColorBase = Theme.ColorKey("accentColorBase", default: .color(.accentColor))
	
	/// Default complimentary color adjustment.
	static let accentColorBaseComplimentary = Theme.ColorKey("accentColorBaseComplimentary", default: .keyAdjusted(.accentColorBase, adjustment: .init(hue: .add(0.15))))
	
	// static let accentColorBaseComplementary // There is no single color or adjustment to work with all accents.
	
	/// Set of accent colors.
	static let accentColors = Theme.ColorKey("accentColors", default: .colorSet(.accentColorBase, complimentary: nil, complementary: nil))
	
	/// Main accent color, `.base` style from `.accentColors` ColorSet..
	static let accentColor = Theme.ColorKey("accentColor", default: .colorInSet(.accentColors, style: .base))
	
	/// An addition to the `accentColor` to go with it, `.complimentary` style from `.accentColors` ColorSet.
	static let accentComplimentary = Theme.ColorKey("accentComplimentary", default: .colorInSet(.accentColors, style: .complimentary))

	/// A contrast to `accentColor` to go on top of it, `.complementary` style from `.accentColors` ColorSet.
	static let accentComplementary = Theme.ColorKey("accentComplementary", default: .colorInSet(.accentColors, style: .complementary))
	
	
	// MARK: - Controls
	
	/// Color of placeholder text on `.backgroundContent`.
	static let placeholder = Theme.ColorKey("placeholder", default: .color(.placeholderText))
	
	static let controlIndicator = Theme.ColorKey("placeholder", default: .color(.secondaryLabel))
	
	
	// MARK: - Others
	
	/// Color to indicate a destructive action.
	static let destructive = Theme.ColorKey("destructive", default: .colorAdjusted(.red, adjustment: .init(brightness: .add(-0.05))))
	
	/// Color for an accessory in a List indicating navigation..
	static let listAccessoryNavigation = Theme.ColorKey("listAccessoryNavigation", default: .color(.secondaryLabel))
	
	/// Color used for as replacement when DebugFlag `.preventLoadingAssets` is set.
	static let debugAssetReplacement = Theme.ColorKey("debugAssetReplacement", default: .color(.orange))
	
}
