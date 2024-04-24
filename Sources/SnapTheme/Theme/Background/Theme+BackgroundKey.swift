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
	
	func shapeStyle(for key: BackgroundKey, in environment: EnvironmentValues) -> (any ShapeStyle)? {
		let value = backgroundValue(for: key)
		return switch value {
			case .surface(let surface, highlight: _): shapeStyle(for: surface, in: environment)
			case .key(_), .system: nil
		}
	}
	
	func background(for backgroundKey: BackgroundKey, highlighted: Bool) -> (any View)? {
		let value = backgroundValue(for: backgroundKey)
		switch value {
				
			case .surface(let surfaceKey, highlight: let highlight):
				return Rectangle()
					.surface(surfaceKey)
					.if(highlighted, transform: { view in
						// Apply highlight if available.
						view.if(unwrap: highlight) { view, highlight in
							view.overlay(
								Rectangle()
									.surface(highlight)
							)
						}
					})
				
			case .key(_), .system: return nil
				
		}
		
	}
	
}
