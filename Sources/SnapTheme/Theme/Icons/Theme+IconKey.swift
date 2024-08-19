//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import Foundation

public extension Theme {
	
	typealias IconKey = Theme.Key<Theme.IconValue>
	
	
	// MARK: - Get Icon
	
	/// Get an `IconValue` registered for an `IconKey`.
	///
	/// - If no value is registered for the key, the `IconValue` set as default is used.
	///
	/// - Parameter key: `IconKey` to get the Icon for.
	/// - Returns: The `IconValue` resolved for the key.
	func icon(_ key: IconKey) -> IconValue {
		let value = icons[key] ?? key.defaultValue
		return switch value {
			case .key(let replacement): icon(replacement)
			default: value
		}
	}
	
}
