//
//  TextSurfaceKeys+Base.swift
//  SnapTheme
//
//  Created by Simon Nickel on 23.06.23.
//

import SwiftUI

public extension Theme {
	
	typealias TextSurfaceKeyType = Theme.FontKey
	typealias TextSurfaceValueType = Theme.SurfaceValue
	
	struct TextSurfaceKey: Codable {
		
		
		// MARK: - Base Text Surfaces
		
		public static var definitionsBase: [TextSurfaceKeyType : TextSurfaceValueType] {[
			
			.listHeader: .color(.foregroundSecondary),
			.listFooter: .color(.foregroundSecondary),
			.listAccessoryNavigation: .color(.listAccessoryNavigation),
			.labelButtonPrimary: .color(.foregroundOnBackground),
			.labelButtonSecondary: .key(.interactiveForeground),
			// Sidebar
			.sidebarTitle: .platform(macOS: .color(.foregroundSecondary), other: .color(.foreground)),
			.sidebarLabelSelected: .color(.foregroundOnBackground),
			.sidebarIcon: .key(.interactiveForeground),
			.sidebarIconSelected: .color(.foregroundOnBackground),
			
		]}
		
	}
	
		
	// MARK: - Get TextSurface

	/// Get a `TextSurfaceValueType aka SurfaceValue` registered for a `TextSurfaceKeyType aka FontKey`.
	///
	/// - If no value is registered for the key, the definition from `Theme.TextSurfaceKey.definitionsBase` is used.
	/// - If `Theme.TextSurfaceKey.definitionsBase` also has no value for the key, `textSurfaceDefault`  is used.
	///
	/// - Parameter key: `FontKey` to get the `ColorKey` for.
	/// - Returns: The `ColorKey` registered for the `FontKey`.
	func textSurface(_ key: TextSurfaceKeyType) -> TextSurfaceValueType {
		return textSurfaces[key] ?? Theme.TextSurfaceKey.definitionsBase[key] ?? textSurfaceDefault
	}
		
}
