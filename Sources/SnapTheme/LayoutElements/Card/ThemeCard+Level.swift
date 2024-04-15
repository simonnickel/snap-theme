//
//  ThemeCard+Level.swift
//
//
//  Created by Simon Nickel on 05.12.23.
//

import Foundation

public extension Theme.Card {
	
	enum Level {
		
		case ground, first
		
		var cornerRadius: Theme.ValueKey {
			return switch self {
					
				case .ground: .cardCornerRadiusGround
				case .first: .cardCornerRadiusFirst
					
			}
		}
		
		
	}
	
}
