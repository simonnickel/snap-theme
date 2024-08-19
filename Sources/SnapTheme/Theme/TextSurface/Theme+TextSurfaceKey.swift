//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

public extension Theme {
	
	typealias TextSurfaceKeyType = Theme.FontKey
	typealias TextSurfaceValueType = Theme.SurfaceValue
	
	struct TextSurfaceKey: Codable {
		
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
