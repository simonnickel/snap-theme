//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapCore

public extension Theme {
	
	typealias ColorKey = Theme.Key<Theme.ColorValue>
	
	
	// MARK: - Get Color
	
	/// Get a`Color` registered for the `ColorKey`.
	///
	/// - If no value is registered for the key, the `ColorValue` set as default is used.
	/// - The result might be a clear color, e.g. if no value is registered and the asset is not found.
	///
	/// - Parameter key: `ColorKey` to get the color for.
	/// - Parameter environment: `EnvironmentValues` the Color is resolved in. Needed to properly calculate adjustments.
	/// - Returns: The `Color` resolved for the key.
	func color(for key: ColorKey, in environment: EnvironmentValues) -> Color {
		let value = colorValue(for: key)
		return color(for: value, with: key, in: environment)
	}
	
	/// Get a`ShapeStyle` of the `Color` registered for the `ColorKey`.
	/// 
	/// - If no value is registered for the key, the `ColorValue` set as default is used.
	/// - The result might be a clear color, e.g. if no value is registered and the asset is not found.
	/// 
	/// - Parameter key: `ColorKey` to get the color for.
	/// - Parameter environment: `EnvironmentValues` the Color is resolved in. Needed to properly calculate adjustments.
	/// - Returns: The `Color` resolved for the key.
	func shapeStyleForColor(key: ColorKey, in environment: EnvironmentValues) -> any ShapeStyle {
		let value = colorValue(for: key)
		return color(for: value, with: key, in: environment)
	}
	
	func systemColor(for key: ColorKey) -> Theme.SystemColor? {
		let value = colorValue(for: key)
		switch value {
			case .color(let color, opacity: _): return color
			default: return nil
		}
	}
	
	func colorSet(for key: ColorKey) -> Theme.ColorSet? {
		let value = colorValue(for: key)
		return switch value {
				
			case .colorSet(let color, complimentary: let complimentary, complementary: let complementary):
				Theme.ColorSet(base: color, complimentary: complimentary, complementary: complementary)
				
			case .colorInSet(let key, style: _): colorSet(for: key)
				
			default: nil
				
		}
	}
	
	func colorValue(for key: ColorKey) -> ColorValue {
		return colors[key] ?? key.defaultValue
	}
	
	private func color(for value: ColorValue, with key: ColorKey, in environment: EnvironmentValues) -> Color {
		if debugFlags.contains(.preventLoadingAssets) {
			switch value {
				case .asset(_): return color(for: .debugAssetReplacement, in: environment)
				default: break
			}
		}
		
		// FB13261000: Assets in Packages will crash previews in other packages.
		let bundle: Bundle = .main
		
		switch value {
				
			case .asset(let name): return Color(name, bundle: bundle)
				
			case .key(let key): return color(for: key, in: environment)
				
			case .keyAdjusted(let key, adjustment: let adjustment):
				let original = color(for: key, in: environment)
				return original.adjusted(adjustment, in: environment)
				
			case .color(let color, opacity: let opacity): return color.value.opacity(opacity)
				
			case .hsba(let hsba): return hsba.color
				
			case .colorAdjusted(let color, adjustment: let adjustment):
				let original = color.value
				return original.adjusted(adjustment, in: environment)
				
			case .colorSet(let key, complimentary: _, complementary: _): return color(for: key, in: environment)
				
			case .colorInSet(let key, style: let style):
				guard let set = colorSet(for: key) else { return .clear }
				let key = set.key(for: style)
				return color(for: key, in: environment)
				
		}
	}
	
}

extension Theme.ColorKey: CustomStringConvertible {
	
	public var description: String { self.id }
	
}
