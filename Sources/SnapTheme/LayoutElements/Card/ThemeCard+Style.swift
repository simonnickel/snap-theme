//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import Foundation

public extension Theme.Card {
	
	/// The style of the Card container.
	enum Style: Sendable {
		
		/// A content card.
		case content
		
		/// An accented card.
		case accent
		
		/// An accented card inside an accented card.
		case accentStack
		
		case custom(color: Theme.ColorKey, background: Theme.BackgroundKey)
		
		var foreground: Theme.ColorKey {
			switch self {
				case .content: .foreground
				case .accent, .accentStack: .foregroundOnBackground
				case .custom(color: let color, background: _): color
			}
		}
		
		func backgroundKey(for level: Theme.Card.Level, in theme: Theme) -> Theme.BackgroundKey {
			switch self {
				case .content: level.backgroundKeyContent
				case .accent: .accent
				case .accentStack: level.backgroundKeyAccent
				case .custom(color: _, background: let background): background
			}
		}
		
	}
	
}
