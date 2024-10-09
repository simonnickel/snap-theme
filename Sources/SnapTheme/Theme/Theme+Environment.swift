//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

// TODO: Use @Entry
private struct ThemeKey: EnvironmentKey {
	
	static let defaultValue: Theme = Theme.base

}

public extension EnvironmentValues {
	var theme: Theme {
		get { self[ThemeKey.self] }
		set { self[ThemeKey.self] = newValue }
	}
}
