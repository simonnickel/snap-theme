//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import Foundation

public extension Theme {
	
	typealias NumberValueType = CGFloat
	
	enum NumberValue: Theme.KeyProtocolRequirements {
		
		/// Define a Number directly.
		case value(Theme.NumberValueType)
		
		/// Reference a different key.
		case key(Theme.NumberKey)
		
		case system
		
	}
	
}
