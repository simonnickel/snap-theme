//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

public extension Theme {
	
	enum ThemeListStyle: String, CaseIterable, Identifiable, CustomStringConvertible {
				
		public var id: String { return self.rawValue }
		
		public var description: String { self.rawValue }
		
		/// Platform specifc default style.
		case automatic
		
		case plain, inset, sidebar
		
#if !os(macOS)
		case grouped, insetGrouped
#endif
		
		var listStyle: any ListStyle {
			switch self {
#if os(macOS)
				case .automatic: return .inset
#else
				case .automatic: return .insetGrouped
				case .grouped: return .grouped
				case .insetGrouped: return .insetGrouped
#endif
				case .plain: return .plain
				case .inset: return .inset
				case .sidebar: return .sidebar
			}
		}
		
	}
	
}

public extension View {
	
	func themeListStyle(_ style: Theme.ThemeListStyle) -> some View {
		return AnyView(self.listStyle(style.listStyle))
	}
	
}
