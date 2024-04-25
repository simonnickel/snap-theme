//
//  ThemeCard+Level.swift
//
//
//  Created by Simon Nickel on 05.12.23.
//

import Foundation

public extension Theme.Card {
	
	/// The level the card is placed on in a card-in-card scenario.
	enum Level {
		
		/// A card on ground level.
		case ground
		
		/// A card inside another card.
		case first
		
		var cornerRadius: Theme.NumberKey {
			return switch self {
					
				case .ground: .cardCornerRadiusGround
				case .first: .cardCornerRadiusFirst
					
			}
		}
		
		var backgroundKeyContent: Theme.BackgroundKey {
			return switch self {
					
				case .ground: .content
				case .first: .contentSecondary
					
			}
		}
		
		var backgroundKeyAccent: Theme.BackgroundKey {
			return switch self {
					
				case .ground: .accent
				case .first: .accentSecondary
					
			}
		}
		
	}
	
}
