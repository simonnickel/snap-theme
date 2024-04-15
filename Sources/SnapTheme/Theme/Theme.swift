//
//  Theme.swift
//  SnapTheme
//
//  Created by Simon Nickel on 05.03.23.
//

import SwiftUI


// MARK: - Default Theme

public extension Theme {
	
	
	// MARK: - Default Theme Definition
	
	static let base: Theme = Theme(
		textSurfaces: Theme.TextSurfaceKey.definitionsBase
	)
	
}


// MARK: - Theme

public struct Theme: Identifiable, Equatable, Hashable, Sendable { // TODO: Codable
	
	public init(
		icons: [IconKey : IconValue] = [:],
		values: [ValueKey : ValueType] = [:],
		scale: CGFloat = 1.0,
		colors: [ColorKey : ColorValue] = [:],
		surfaces: [SurfaceKey : SurfaceValue] = [:],
		backgrounds: [BackgroundKey : BackgroundValue] = [:],
		fonts: [FontKey : Theme.FontValue] = [:],
		fontDesignDefault: Font.Design = .default,
		fontFamilyDefault: Theme.FontDefinition.FontFamily = .system,
		textSurfaces: [Theme.TextSurfaceKeyType : Theme.TextSurfaceValueType] = [:],
		textSurfaceDefault: Theme.TextSurfaceValueType = .color(.foreground),
		debugFlags: [DebugFlag] = []
	) {
		self.icons = icons
		self.values = values
		self.scale = scale
		self.colors = colors
		self.surfaces = surfaces
		self.backgrounds = backgrounds
		self.fonts = fonts
		self.fontDesignDefault = fontDesignDefault
		self.fontFamilyDefault = fontFamilyDefault
		self.textSurfaces = textSurfaces
		self.textSurfaceDefault = textSurfaceDefault
		self.debugFlags = debugFlags
	}
	
	public let id: UUID = UUID()
	
	public var icons: [IconKey : IconValue]
	
	public var values: [ValueKey : ValueType]
	
	/// Scale factor used for all sizes (fonts + values).
	public var scale: CGFloat
	
	/// Color definition for base set of keys defined in `ColorKey`.
	///
	/// If a definition is set for a key, this value is used when retrieving the color. There is no way to fall back to default when a key is set (see `ThemeColor.color(for:)`).
	public var colors: [ColorKey : ColorValue]
	
	public var surfaces: [SurfaceKey : SurfaceValue]
	
	public var backgrounds: [BackgroundKey : BackgroundValue]
	
	public var fonts: [FontKey : FontValue]
	public var fontDesignDefault: Font.Design
	public var fontFamilyDefault: Theme.FontDefinition.FontFamily
	
	public var textSurfaces: [Theme.TextSurfaceKeyType : Theme.TextSurfaceValueType]
	public var textSurfaceDefault: Theme.TextSurfaceValueType

	internal var debugFlags: [DebugFlag]
	
	
	// MARK: Adjust
	
	public func replacingDefinitions(
		icons: [IconKey : IconValue]? = nil,
		values: [ValueKey : ValueType]? = nil,
		scale: CGFloat? = nil,
		colors: [ColorKey : ColorValue]? = nil,
		surfaces: [SurfaceKey : SurfaceValue]? = nil,
		backgrounds: [BackgroundKey : BackgroundValue]? = nil,
		fonts: [FontKey : FontValue]? = nil,
		fontDesignDefault: Font.Design? = nil,
		fontFamilyDefault: FontDefinition.FontFamily? = nil,
		textSurfaces: [Theme.TextSurfaceKeyType : Theme.TextSurfaceValueType]? = nil,
		textSurfaceDefault: Theme.TextSurfaceValueType? = nil,
		debugFlags: [DebugFlag]? = nil
	) -> Theme {
		return Theme(
			icons: icons ?? self.icons,
			values: values ?? self.values,
			scale: scale ?? self.scale,
			colors: colors ?? self.colors,
			surfaces: surfaces ?? self.surfaces,
			backgrounds: backgrounds ?? self.backgrounds,
			fonts: fonts ?? self.fonts,
			fontDesignDefault: fontDesignDefault ?? self.fontDesignDefault,
			fontFamilyDefault: fontFamilyDefault ?? self.fontFamilyDefault,
			textSurfaces: textSurfaces ?? self.textSurfaces,
			textSurfaceDefault: textSurfaceDefault ?? self.textSurfaceDefault,
			debugFlags: debugFlags ?? self.debugFlags
		)
	}
	
	public func replacingValues(
		icons: [IconKey : IconValue] = [:],
		values: [ValueKey : ValueType] = [:],
		scale: CGFloat? = nil,
		colors: [ColorKey : ColorValue] = [:],
		surfaces: [SurfaceKey : SurfaceValue] = [:],
		backgrounds: [BackgroundKey : BackgroundValue] = [:],
		fonts: [FontKey : FontValue] = [:],
		fontDesignDefault: Font.Design? = nil,
		fontFamilyDefault: FontDefinition.FontFamily? = nil,
		textSurfaces: [Theme.TextSurfaceKeyType : Theme.TextSurfaceValueType] = [:],
		textSurfaceDefault: Theme.TextSurfaceValueType? = nil,
		debugFlags: [DebugFlag] = []
	) -> Theme {
		return Theme(
			icons: self.icons.merging(icons, uniquingKeysWith: { $1 }),
			values: self.values.merging(values, uniquingKeysWith: { $1 }),
			scale: scale ?? self.scale,
			colors: self.colors.merging(colors, uniquingKeysWith: { $1 }),
			surfaces: self.surfaces.merging(surfaces, uniquingKeysWith: { $1 }),
			backgrounds: self.backgrounds.merging(backgrounds, uniquingKeysWith: { $1 }),
			fonts: self.fonts.merging(fonts, uniquingKeysWith: { $1 }),
			fontDesignDefault: fontDesignDefault ?? self.fontDesignDefault,
			fontFamilyDefault: fontFamilyDefault ?? self.fontFamilyDefault,
			textSurfaces: self.textSurfaces.merging(textSurfaces, uniquingKeysWith: { $1 }),
			textSurfaceDefault: textSurfaceDefault ?? self.textSurfaceDefault,
			debugFlags: self.debugFlags + debugFlags
		)
	}
	
	public func replaceAccent(base: Color) -> Theme {
		guard let colorSet = Theme.ColorKey.systemColorSet(for: base) else { return self }
		
		return self.replacingValues(
			colors: [
				.accentColors : .colorSet(colorSet.base, complimentary: colorSet.complimentary, complementary: colorSet.complementary)
			]
		)
			
	}
	
}
