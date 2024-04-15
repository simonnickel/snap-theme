//
//  Theme+SurfaceValue.swift
//  SnapTheme
//
//  Created by Simon Nickel on 08.11.23.
//

import SwiftUI
import SnapCore

public extension Theme {
	
	enum SurfaceValue: Theme.KeyProtocolRequirements  {
		
		case color(Theme.ColorKey)
		
		case colorAdjusted(ColorKey, hue: Color.ValueAdjustment? = nil, saturation: Color.ValueAdjustment? = nil, brightness: Color.ValueAdjustment? = nil, alpha: Color.ValueAdjustment? = nil)
		
		case material(Theme.SystemMaterial, colorScheme: SystemColorScheme? = nil)
		
		case gradient(Theme.SystemGradient)
		
		case key(Theme.SurfaceKey)
		
	}
	
}

extension Theme.SurfaceValue: CustomStringConvertible {
	
	public var description: String {
		return switch self {
			case .color(let color): ".color(\(color))"
			case .colorAdjusted(let key, hue: let hue, saturation: let saturation, brightness: let brightness, alpha: let alpha): "Adjusted Key: .\(key), h: \(hue?.description ?? "-"), s: \(saturation?.description ?? "-"), b: \(brightness?.description ?? "-"), a: \(alpha?.description ?? "-")"
			case .material(let material, let colorScheme): ".material(\(material), displayMode: \(colorScheme?.description ?? "-")"
			case .gradient(let gradient): ".gradient(\(gradient))"
			case .key(let key): ".key(\(key.id))"
		}
	}
	
}
