//
//  Environment+Highlight.swift
//  SnapTheme
//
//  Created by Simon Nickel on 05.01.24.
//

import SwiftUI

private struct HighlightEnvironmentKey: EnvironmentKey {
	static let defaultValue: Bool = false
}

public extension EnvironmentValues {
	
	var highlighted: Bool {
		get { self[HighlightEnvironmentKey.self] }
		set { self[HighlightEnvironmentKey.self] = newValue }
	}
	
}
