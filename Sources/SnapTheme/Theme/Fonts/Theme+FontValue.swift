//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import Foundation

public extension Theme {
	
	enum FontValue: Theme.KeyProtocolRequirements {
		
		/// Define a Font directly.
		case definition(Theme.FontDefinition)
		
		/// Reference a different key.
		case key(Theme.FontKey)
		
		case system
		
	}
	
}
