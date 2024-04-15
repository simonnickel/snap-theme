//
//  Theme+FontKey.swift
//  SnapTheme
//
//  Created by Simon Nickel on 13.10.23.
//

import SwiftUI

public extension Theme {
	
	typealias FontKey = Theme.Key<Theme.FontValue>
	
	
	// MARK: - Get Font
	
	/// Get a `Font` registered for a `FontKey`.
	///
	/// - If no value is registered for the key, the `FontDefinition` set as default is used.
	///
	/// - Parameters:
	///   - key: `FontKey` to get the Font for.
	///   - size: Override of the defined size as `CGFloat`.
	/// - Returns: The `Font` registered for the key.
	func font(_ key: FontKey, sizeOverride: CGFloat? = nil) -> Font? {
		guard let definition = fontDefinition(for: key) else { return nil}
		
		let size: CGFloat = sizeOverride ?? definition.size
		let weight: Font.Weight = definition.weight.value
		let design: Font.Design = definition.design?.value ?? fontDesignDefault
		
		switch definition.family ?? fontFamilyDefault {
			case .custom(let name):
				return Font.custom(name, size: size, relativeTo: .body).weight(weight)
				
			default:
				return .system(size: size, weight: weight, design: design)
		}
	}
	
	func fontDefinition(for key: FontKey) -> Theme.FontDefinition? {
		let fontValue: Theme.FontValue? = fonts[key] ?? key.defaultValue
		
		guard let fontValue else { return nil }
		
		return switch fontValue {
			case .definition(let definition): definition
			case .key(let key): fontDefinition(for: key)
			case .system: nil
		}
	}
	
}
