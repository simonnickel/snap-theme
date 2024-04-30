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
	
	func shapeStyle(for key: BackgroundKey?, in environment: EnvironmentValues) -> (any ShapeStyle)? {
		guard let key else { return nil }
		let value = backgroundValue(for: key)
		return switch value {
			case .surface(let surface, highlight: _): shapeStyle(for: surface, in: environment)
			case .key(_), .system: nil
		}
	}
	
	func background(for backgroundKey: BackgroundKey?, highlighted: Bool) -> (any View)? {
		guard let backgroundKey else { return nil }
		let value = backgroundValue(for: backgroundKey)
		switch value {
				
			case .surface(let surfaceKey, highlight: let highlight):
				return Rectangle()
					.theme(surface: surfaceKey)
					.if(unwrap: highlight) { view, highlight in
						view.overlay(
							Rectangle()
								.theme(surface: highlight)
								.opacity(highlighted ? 1 : 0)
						)
					}
				
			case .key(_), .system: return nil
				
		}
		
	}
	
}
