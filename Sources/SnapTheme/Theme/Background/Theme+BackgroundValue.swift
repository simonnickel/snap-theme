//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

public extension Theme {
	
	indirect enum BackgroundValue: Theme.KeyProtocolRequirements {
		
		case system
		
		case surface(Theme.SurfaceKey, highlight: Theme.SurfaceKey? = nil)
		
		case key(Theme.BackgroundKey)
		
	}
	
}
