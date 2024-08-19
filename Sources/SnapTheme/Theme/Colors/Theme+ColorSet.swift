//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import Foundation

public extension Theme {
	
	struct ColorSet: Identifiable, Theme.KeyProtocolRequirements {
		
		public enum Style : String, Theme.KeyProtocolRequirements {
			case base, complimentary, complementary
		}
		
		public init(base: Theme.ColorKey, complimentary: Theme.ColorKey? = nil, complementary: Theme.ColorKey? = nil) {
			self.base = base
			self.complimentary = complimentary
			self.complementary = complementary
		}
		
		public let base: Theme.ColorKey
		public let complimentary: Theme.ColorKey?
		public let complementary: Theme.ColorKey?
		
		public var id: String { base.key + (complimentary?.key ?? "") + (complementary?.key ?? "") }
		
		public func key(for style: Style) -> Theme.ColorKey {
			return switch style {
				case .base: base
				case .complimentary: complimentary ?? base
				case .complementary: complementary ?? base
			}
		}
		
	}
	
}
