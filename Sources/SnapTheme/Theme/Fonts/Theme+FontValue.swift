//
//  Theme+FontValue.swift
//  SnapTheme
//
//  Created by Simon Nickel on 13.10.23.
//

import Foundation

public extension Theme {
	
	enum FontValue: Theme.KeyProtocolRequirements {
		
		/// Define a Font directly
		case definition(Theme.FontDefinition)
		
		/// Reference a different key.
		case key(Theme.FontKey)
		
		case system
		
	}
	
}
