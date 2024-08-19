//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

public extension Theme {
	
	/// Wrapper to conform to Codable.
	enum SystemMaterial: String, Identifiable, Theme.KeyProtocolRequirements {
		public var id: String { rawValue }
		
		/// A material that's somewhat translucent.
		case regular

		/// A material that's more opaque than translucent.
		case thick

		/// A material that's more translucent than opaque.
		case thin

		/// A mostly translucent material.
		case ultraThin

		/// A mostly opaque material.
		case ultraThick
		
		/// A material matching the style of system toolbars.
		case bar
		
		public var value: Material {
			switch self {
				case .regular: .regular
				case .thick: .thick
				case .thin: .thin
				case .ultraThin: .ultraThin
				case .ultraThick: .ultraThick
				case .bar: .bar
			}
		}
		
	}
	
}
