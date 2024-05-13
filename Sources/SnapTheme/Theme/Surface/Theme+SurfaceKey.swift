//
//  Theme+SurfaceKey.swift
//	SnapTheme
//
//  Created by Simon Nickel on 08.11.23.
//

import SwiftUI

public extension Theme {
	
	typealias SurfaceKey = Theme.Key<Theme.SurfaceValue>
	
	
	// MARK: - Get Surface
	
	/// Get an `SurfaceValue` registered for an `SurfaceKey`.
	///
	/// - If no value is registered for the key, the `SurfaceValue` set as default is used.
	///
	/// - Parameter key: `SurfaceKey` to get the Icon for.
	/// - Returns: The `SurfaceValue` resolved for the key.
	func surfaceValue(for key: SurfaceKey) -> SurfaceValue {
		let value = surfaces[key] ?? key.defaultValue
		return switch value {
			default: value
		}
	}
	
	func shapeStyleForSurface(key: SurfaceKey, in environment: EnvironmentValues) -> any ShapeStyle {
		let value = surfaceValue(for: key)
		return shapeStyleForSurface(value: value, in: environment)
	}
	
	func shapeStyleForSurface(value: SurfaceValue, in environment: EnvironmentValues) -> any ShapeStyle {
		return switch value {
			case .color(let colorKey): self.color(for: colorKey, in: environment)
			case .colorAdjusted(let colorKey, hue: let hue, saturation: let saturation, brightness: let brightness, alpha: let alpha): self.color(for: colorKey, in: environment).adjusted(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha, in: environment)
			case .material(let material, colorScheme: _): material.value
			case .gradient(let gradient): gradient.shapeStyle(for: self, in: environment)
			case .key(let surfaceKey): shapeStyleForSurface(key: surfaceKey, in: environment)
		}
	}
	
}
