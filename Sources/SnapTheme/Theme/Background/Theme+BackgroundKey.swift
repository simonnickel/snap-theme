//
//  Theme+BackgroundKey.swift
//	SnapTheme
//
//  Created by Simon Nickel on 30.10.23.
//

import SwiftUI
import SnapCore

public extension Theme {
	
	typealias BackgroundKey = Theme.Key<Theme.BackgroundValue>
	
	
	// MARK: - Get Background
	
	func backgroundValue(for key: BackgroundKey) -> BackgroundValue {
		let value = backgrounds[key] ?? key.defaultValue
		
		return switch value {
			case .key(let key): backgroundValue(for: key)

			default: value
				
		}
	}
	
	func shapeStyleForBackground(key: BackgroundKey?, in environment: EnvironmentValues) -> (any ShapeStyle)? {
		guard let key else { return nil }
		let value = backgroundValue(for: key)
		return switch value {
			case .surface(let surface, highlight: _): shapeStyleForSurface(key: surface, in: environment)
			case .key(_), .system: nil
		}
	}
	
	func backgroundView(key: BackgroundKey?, shape: ThemeShape.Style?, stroke: ThemeShape.Stroke?, highlighted: Bool) -> (any View)? {
		guard let key else { return nil }
		let value = backgroundValue(for: key)
		switch value {
				
			case .surface(let surfaceKey, highlight: let highlight):
				return ThemeShape(shape, fill: surfaceKey, stroke: stroke)
					.if(unwrap: highlight) { view, highlight in
						view.overlay(
							ThemeShape(shape)
								.theme(surface: highlight)
								.opacity(highlighted ? 1 : 0)
						)
					}
				
			case .key(_), .system: return nil
				
		}
		
	}
	
}
