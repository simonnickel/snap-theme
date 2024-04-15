//
//  SurfaceKeys+Base.swift
//  SnapTheme
//
//  Created by Simon Nickel on 08.11.23.
//

import Foundation
import SnapCore

public extension Theme.SurfaceKey {
		
	static let allBaseKeys: [Theme.SurfaceKey] = [
		accentGradientForeground, accentGradientBackground,
		accentForeground, accentBackground, interactiveForeground, interactiveBackground,
		overlayHighlightPush, overlayHighlightPushIntense, overlayHighlightDrop, overlayHighlightContent, overlayHighlightAccent, uiIndicator
	]
	
	
	// MARK: Forwards
	
	/// Helper to quickly create a Surface with a color.
	static func color(_ key: Theme.ColorKey) -> Theme.SurfaceKey {
		return Theme.SurfaceKey(UUID().uuidString, default: .color(key))
	}
	
	/// Helper to quickly create a Surface with a material.
	static func material(_ material: Theme.SystemMaterial, colorScheme: SystemColorScheme? = nil) -> Theme.SurfaceKey {
		return Theme.SurfaceKey(UUID().uuidString, default: .material(material, colorScheme: colorScheme))
	}
	
	
	// MARK: Base
	
	static let accentGradientForeground = Theme.SurfaceKey("accentGradientForeground", default:
			.gradient(.angular([.accentColor, .accentComplimentary, .accentColor, .accentColor], center: .center))
	)
	
	static let accentGradientBackground = Theme.SurfaceKey("accentGradientBackground", default:
			.gradient(.linear([.accentColor, .accentColor, .accentComplimentary], start: .topLeading, end: .bottomTrailing))
	)
	
	
	// MARK: Accent
	
	static let accentForeground = Theme.SurfaceKey("accentForeground", default: .color(.accentColor))
	
	static let accentBackground = Theme.SurfaceKey("accentBackground", default: .color(.accentColor))
	
	static let interactiveForeground = Theme.SurfaceKey("interactiveForeground", default: .color(.accentColor))
	
	static let interactiveBackground = Theme.SurfaceKey("interactiveBackground", default: .color(.accentColor))
	
	
	// MARK: - Overlay
	
	/// Color of overlay to highlight a view on interaction with push characteristic.
	static let overlayHighlightPush = Theme.SurfaceKey("overlayHighlightPush", default: .colorAdjusted(.white, alpha: .replace(0.15)))
	
	/// Color of overlay to highlight a view on interaction with intense push characteristic.
	static let overlayHighlightPushIntense = Theme.SurfaceKey("overlayHighlightPushIntense", default: .colorAdjusted(.white, alpha: .replace(0.25)))
	
	/// Color of overlay to highlight a view on interaction with drop characteristic.
	static let overlayHighlightDrop = Theme.SurfaceKey("overlayHighlightDrop", default: .colorAdjusted(.black, alpha: .replace(0.15)))
	
	/// Color of overlay to highlight a content view on selection.
	static let overlayHighlightContent = Theme.SurfaceKey("overlayHighlightContent", default: .colorAdjusted(.accentColor, hue: nil, saturation: .add(-0), brightness: nil, alpha: .replace(0.3)))
	
	/// Color of overlay to highlight an accent on selection.
	static let overlayHighlightAccent = Theme.SurfaceKey("overlayHighlightAccent", default: .color(.accentComplimentary))
	
	
	// MARK: - Others
	
	/// Color for an interface element, representing an action or navigation.
	/// Base value tries to be close to sheet drag handle.
	static let uiIndicator = Theme.SurfaceKey("uiIndicator", default: .colorAdjusted(.foreground, alpha: .replace(0.22))) // Value by trying to compare to sheet drag handle.
	
}
