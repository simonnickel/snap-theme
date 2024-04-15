//
//  Theme+ColorValue.swift
//  SnapTheme
//
//  Created by Simon Nickel on 13.10.23.
//

import SwiftUI
import SnapCore

public extension Theme {
	
	enum ColorValue: Theme.KeyProtocolRequirements {
		
		/// Color from assets catalog with specific `name`.
		///
		/// Be careful with Assets in Packages, they will crash previews (FB13261000).
		///
		/// `theme.color(for: .text)` with definition `.text : .name("custom")` looks in assets for color named `custom`.
		case asset(String)
		
		/// Use Color defined under different key.
		///
		/// `theme.color(for: .text)` with definition `.text : .key(.accent)` uses color as defined for key `.accent`.
		case key(ColorKey)
		
		/// Use Color defined under different key with adjustments applied.
		///
		/// `theme.color(for: .text)` with definition `.text : .keyAdjusted(.accent, ...)` uses color as defined for key `.accent`, adjusted by hsba values.
		case keyAdjusted(ColorKey, adjustment: Color.Adjustment?)
		
		/// Use `Theme.SystemColor`
		///
		/// `theme.color(for: .text)` with definition `.text : .color(.green)` uses `Color.green`.
		case color(Theme.SystemColor, opacity: Double = 1.0)
		
		case hsba(Color.HSBA)
		
		/// Use `Theme.SystemColor` with adjustments applied.
		///
		/// `theme.color(for: .text)` with definition `.text : .colorAdjusted(.green, ...)` uses `Color.green`, adjusted by hsba values.
		case colorAdjusted(Theme.SystemColor, adjustment: Color.Adjustment?)
		
		case colorSet(ColorKey, complimentary: ColorKey?, complementary: ColorKey?)
		
		case colorInSet(ColorKey, style: Theme.ColorSet.Style)
		
	}
	
}

extension Theme.ColorValue: CustomStringConvertible {
	
	public var description: String {
		return switch self {
			case .asset(let name): "Asset: \(name)"
			case .key(let key): "Key: .\(key)"
			case .keyAdjusted(let key, adjustment: let adjustment): "Adjusted Key: .\(key), \(adjustment?.description ?? "-")"
			case .color(let color, let opacity): ".\(color) at: \(opacity)"
			case .hsba(let hsba): hsba.description
			case .colorAdjusted(let color, adjustment: let adjustment): "Adjusted Color: .\(color), \(adjustment?.description ?? "-")"
			case .colorSet(let color, complimentary: let complimentary, complementary: let complementary): "Color Set: \(color.key), \(complimentary?.key ?? "-"), \(complementary?.key ?? "-")"
			case .colorInSet(let key, style: let style): "Color in set: \(key.id) for style: .\(style)"
		}
	}
	
}
