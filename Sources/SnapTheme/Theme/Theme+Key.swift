//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import Foundation

public extension Theme {
	
	typealias KeyProtocolRequirements = Codable & Hashable & Equatable & Sendable
	
	final class Key<T>: Identifiable, KeyProtocolRequirements where T: Theme.KeyProtocolRequirements {
		
		public typealias KeyType = String
		
		public init(_ key: KeyType, `default`: T) {
			self.key = key
			self.defaultValue = `default`
		}
		
		public var id: String { key }
		public let key: KeyType
		public let defaultValue: T
		
		public static func == (lhs: Theme.Key<T>, rhs: Theme.Key<T>) -> Bool {
			lhs.hashValue == rhs.hashValue
		}
		
		public func hash(into hasher: inout Hasher) {
			hasher.combine(key)
			hasher.combine(defaultValue)
		}
		
	}
	
}
