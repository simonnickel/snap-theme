//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

// TODO: Use @Entry
private struct HighlightEnvironmentKey: EnvironmentKey {
	static let defaultValue: Bool = false
}

public extension EnvironmentValues {
	
	var highlighted: Bool {
		get { self[HighlightEnvironmentKey.self] }
		set { self[HighlightEnvironmentKey.self] = newValue }
	}
	
}
