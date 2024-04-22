//
//  Theme+NumberKey.swift
//  SnapTheme
//
//  Created by Simon Nickel on 13.10.23.
//

import Foundation

public extension Theme {
	
	typealias NumberType = CGFloat?

	typealias NumberKey = Theme.Key<Theme.NumberType>
	
	
	// MARK: - Value + Scaling
	
	/// Get a `NumberType aka CGFloat` registered for a `NumberKey`.
	///
	/// - If no value is registered for the key, the `NumberType` set as default is used.
	///
	/// - Parameter key: `NumberKey` to get the Icon for.
	/// - Returns: The `NumberType` registered for the key.
	func value(_ key: NumberKey) -> NumberType {
		return if let value = numbers[key] {
			value
		} else {
			key.defaultValue
		}
	}
	
	/// Get a **scaled** value of `NumberType aka CGFloat` registered for a `NumberKey`.
	///
	/// - If no value is registered for the key, the `NumberType` from `Theme.NumberKey.definitionsBase` is used.
	/// - If `Theme.NumberKey.definitionsBase` also has no value for the key, `Theme.NumberKey.defaultValue`  is used.
	///
	///	Value is scaled by the scale configured at (`Theme.scale`) and the provided factor, which should be scaled by `@ScaledMetric`, see example below:
	///
	///	```
	///	@Environment(\.theme) private var theme
	///	@ScaledMetric private var scaleFactor: CGFloat = 1
	///	VStack(spacing: theme.value(.spacingElements, scaled: scaleFactor)) {}
	///	```
	///
	/// - Parameters:
	///   - key: `NumberKey` to get the Icon for.
	///   - factor: Additional factor as `CGFloat`, should be scaled by `@ScaledMetric`.
	/// - Returns: **`value * theme.scale * factor`** --- The `NumberType` registered for the key, scaled by `theme.scale` and `factor`.
	func value(_ key: NumberKey, scaled factor: CGFloat) -> NumberType {
		guard let valueOfKey = value(key) else { return nil }
		return valueOfKey * scale(with: factor)
	}
	
	/// Generate a scale factor to apply to sizes.
	///
	/// Value is based on the scale set for the Theme (`Theme.scale`) and the provided factor, which should be scaled by `@ScaledMetric`.
	///
	///	```
	///	@Environment(\.theme) private var theme
	///	@ScaledMetric private var scaleFactor: CGFloat = 1
	///	VStack(spacing: 10 * theme.scale(with: scaleFactor)) {}
	///	```
	///	Should be used directly when used with a `ThemeValue`:
	///	```
	///	VStack(spacing: theme.value(.spacingElements, scaled: scaleFactor)) {}
	///	```
	///
	/// - Parameter factor: Additional factor as `CGFloat`, should be scaled by `@ScaledMetric`.
	/// - Returns: Scale factor to apply to sizes.
	func scale(with factor: CGFloat) -> CGFloat {
		return scale * factor
	}
	
}
