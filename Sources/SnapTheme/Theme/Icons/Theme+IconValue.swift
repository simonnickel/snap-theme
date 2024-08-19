//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

public extension Theme {
	
	enum IconValue: Theme.KeyProtocolRequirements {
		
		/// System SF Symbol.
		case system(name: String)
		
		/// Custom SF Symbol available in .main bundle.
		case custom(name: String)
		
		/// Reference a different key.
		case key(Theme.IconKey)
		
		public var image: Image {
			switch self {
				case .system(name: let name): return Image(systemName: name)
				case .custom(name: let name): return Image(name, bundle: .main)
				case .key(_): return Image(systemName: "questionmark.diamond")
			}
		}
	}
	
}
