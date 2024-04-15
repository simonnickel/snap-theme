//
//  Theme+Environment.swift
//	SnapTheme
//
//  Created by Simon Nickel on 11.10.23.
//

import SwiftUI

private struct ThemeKey: EnvironmentKey {
	
	static let defaultValue: Theme = Theme.base

}

public extension EnvironmentValues {
	var theme: Theme {
		get { self[ThemeKey.self] }
		set { self[ThemeKey.self] = newValue }
	}
}
