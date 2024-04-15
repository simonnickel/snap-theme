//
//  Theme+Platform.swift
//  SnapTheme
//
//  Created by Simon Nickel on 21.10.23.
//

import Foundation

public extension Theme.TextSurfaceValueType {
	static func platform(macOS: Theme.TextSurfaceValueType, other: Theme.TextSurfaceValueType) -> Theme.TextSurfaceValueType {
#if os(macOS)
		return macOS
#else
		return other
#endif
	}
}

public extension CGFloat {
	static func platform(macOS: CGFloat, other: CGFloat) -> CGFloat {
#if os(macOS)
		return macOS
#else
		return other
#endif
	}
}
