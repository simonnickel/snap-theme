//
//  Theme+Platform.swift
//  SnapTheme
//
//  Created by Simon Nickel on 21.10.23.
//

import Foundation

public extension Theme.BackgroundValue {
	static func platform(macOS: Theme.BackgroundValue, other: Theme.BackgroundValue) -> Theme.BackgroundValue {
#if os(macOS)
		return macOS
#else
		return other
#endif
	}
}

public extension Theme.ColorValue {
	static func platform(macOS: Theme.ColorValue, other: Theme.ColorValue) -> Theme.ColorValue {
#if os(macOS)
		return macOS
#else
		return other
#endif
	}
}

public extension Theme.FontValue {
	static func platform(macOS: Theme.FontValue, other: Theme.FontValue) -> Theme.FontValue {
#if os(macOS)
		return macOS
#else
		return other
#endif
	}
}

public extension Theme.IconValue {
	static func platform(macOS: Theme.IconValue, other: Theme.IconValue) -> Theme.IconValue {
#if os(macOS)
		return macOS
#else
		return other
#endif
	}
}

public extension Theme.NumberValue {
	static func platform(macOS: Theme.NumberValue, other: Theme.NumberValue) -> Theme.NumberValue {
#if os(macOS)
		return macOS
#else
		return other
#endif
	}
}

public extension Theme.SurfaceValue {
	static func platform(macOS: Theme.SurfaceValue, other: Theme.SurfaceValue) -> Theme.SurfaceValue {
#if os(macOS)
		return macOS
#else
		return other
#endif
	}
}
