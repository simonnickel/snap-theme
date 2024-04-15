//
//  Theme+BackgroundValue.swift
//  SnapTheme
//
//  Created by Simon Nickel on 30.10.23.
//

import SwiftUI

public extension Theme {
	
	indirect enum BackgroundValue: Theme.KeyProtocolRequirements {
		
		case system
		
		case surface(Theme.SurfaceKey, highlight: Theme.SurfaceKey? = nil)
		
		case key(Theme.BackgroundKey)
		
		case platform(macOS: BackgroundValue, other: BackgroundValue)
		
	}
	
}
