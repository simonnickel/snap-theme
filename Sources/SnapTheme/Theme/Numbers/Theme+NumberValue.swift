//
//  Theme+NumberValue.swift
//  SnapTheme
//
//  Created by Simon Nickel on 22.04.24.
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
