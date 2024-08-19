//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import Foundation

public extension Theme {

	typealias NumberKey = Theme.Key<Theme.NumberValue>
	
	
	// MARK: - Value + Scaling
	
	/// Get a `NumberValueType?` registered for a `NumberKey`.
	///
	/// - If no value is registered for the key, the `Theme.NumberKey.defaultValue`  is used.
	///
	/// - Parameter key: `NumberKey` to get the Icon for.
	/// - Returns: The `NumberValueType` resolved for the key. Nil indicates to use the system value.
	func number(_ key: NumberKey?) -> NumberValueType? {
		guard let key else { return nil }
		let value = numbers[key] ?? key.defaultValue
		return switch value {
			case .key(let replacement): number(replacement)
			case .value(let value): value
			case .system: nil
		}
	}
	
	/// Get a **scaled** value of `NumberValue` registered for a `NumberKey`.
	///
	/// - If no value is registered for the key, the `Theme.NumberKey.defaultValue`  is used.
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
	///   - factor: Additional factor as `NumberValueType aka CGFloat`, should be scaled by `@ScaledMetric`.
	/// - Returns: **`value * theme.scale * factor`** --- The `NumberValue` resolved for the key, scaled by `theme.scale` and `factor`.
	func number(_ key: NumberKey?, scaled factor: NumberValueType) -> NumberValueType? {
		guard let key, let valueOfKey = number(key) else { return nil }
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
