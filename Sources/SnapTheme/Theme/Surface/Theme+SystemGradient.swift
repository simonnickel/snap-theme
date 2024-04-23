//
//  Theme+SystemGradient.swift
//  SnapTheme
//
//  Created by Simon Nickel on 07.11.23.
//

import SwiftUI

public extension Theme {
	
	enum SystemGradient: Theme.KeyProtocolRequirements {
		
		
		// MARK: Options
		
		case angular(_ colors: [Theme.ColorKey], center: UnitPoint = .center, angle: Angle = .zero)
		
		case linear(_ colors: [Theme.ColorKey], start: UnitPoint = .top, end: UnitPoint = .bottom)
		
		case radial(_ colors: [Theme.ColorKey], center: UnitPoint = .center, start: CGFloat, end: CGFloat)
		
		
		// MARK: ShapeStyle
		
		func shapeStyle(for theme: Theme, in environment: EnvironmentValues) -> any ShapeStyle {
			switch self {
					
				case .angular(let colors, center: let center, angle: let angle):
					return gradient(for: theme, in: environment, colorKeys: colors) { colors in
						AngularGradient(colors: colors, center: center, angle: angle)
					}
					
				case .linear(let colors, start: let start, end: let end):
					return gradient(for: theme, in: environment, colorKeys: colors) { colors in
						LinearGradient(colors: colors, startPoint: start, endPoint: end)
					}
					
				case .radial(let colors, center: let center, start: let start, end: let end):
					return gradient(for: theme, in: environment, colorKeys: colors) { colors in
						RadialGradient(colors: colors, center: center, startRadius: start, endRadius: end)
					}
					
			}
		}
		
		// TODO finetuning: What is more performant checking or rendering a single color gradient?
		/// Filter colors to prevent rendering a gradient of a single color.
		private func gradient(for theme: Theme, in environment: EnvironmentValues, colorKeys: [Theme.ColorKey], factory: ([Color]) -> any ShapeStyle) -> any ShapeStyle {
			let colorsResolved: [Color] = colorKeys.map({ theme.color(for: $0, in: environment) })
			let uniqueColors = Set(colorsResolved)
			return switch uniqueColors.count {
				case 0: .clear
				case 1: uniqueColors.first ?? .clear
				default: factory(colorsResolved)
			}
		}
		
		
		// MARK: BaseColor
		
		var baseColor: Theme.ColorKey? {
			switch self {
				case .angular(let colors, center: _, angle: _): return colors.first
				case .linear(let colors, start: _, end: _): return colors.first
				case .radial(let colors, center: _, start: _, end: _): return colors.first
			}
		}
		
	}
	
}

extension Theme.SystemGradient: CustomStringConvertible {
	public var description: String {
		return switch self {
			case .angular(let colors, center: let center, angle: let angle): "Angular, colors: \(colors.map({ $0.id }).joined(separator: ",")), center: \(center), angle: \(angle)"
			case .linear(let colors, start: let start, end: let end): "Linear, colors: \(colors.map({ $0.id }).joined(separator: ",")), start: \(start), end: \(end)"
			case .radial(let colors, center: let center, start: let start, end: let end): "Radial, colors: \(colors.map({ $0.id }).joined(separator: ",")), center: \(center), start: \(start), end: \(end)"
		}
	}
}


// MARK: - Preview

#Preview {

	return ThemePreviewContainer(.view) {
		
		// Angular
		
		let angularSurface = Theme.SurfaceKey("angularSurface", default:
				.gradient(
					.angular([.accentPrimary, .accentComplimentary, .accentPrimary, .accentComplimentary, .accentComplimentary, .accentPrimary])
				)
		)
		
		let angularBackground = Theme.BackgroundKey("angularBackground", default:
				.surface(
					angularSurface,
					highlight: .overlayHighlightAccent
				)
		)
		
		Text("Angular Gradient")
			.theme(padding: .cardPadding)
			.theme(color: .foregroundOnBackground)
			.theme(text: .cardTitle)
			.theme(background: angularBackground, highlighted: false)
		
		
		// Linear
		
		let linearSurface = Theme.SurfaceKey("linearSurface", default:
				.gradient(.linear([.accentPrimary, .accentComplimentary, .accentPrimary, .accentComplimentary, .accentComplimentary, .accentPrimary], start: .topLeading, end: .bottomTrailing))
		)
		
		let linearBackground = Theme.BackgroundKey("linearBackground", default:
				.surface(linearSurface, highlight: .overlayHighlightAccent)
		)
		
		Text("Linear Gradient")
			.theme(padding: .cardPadding)
			.theme(color: .foregroundOnBackground)
			.theme(text: .cardTitle)
			.theme(background: linearBackground, highlighted: false)
		
		
		// Radial
		
		let radialSurface = Theme.SurfaceKey("radialSurface", default:
				.gradient(.radial([.accentPrimary, .accentComplimentary, .accentPrimary, .accentComplimentary, .accentComplimentary, .accentPrimary], center: .center, start: 20, end: 200))
		)
		let radialBackground = Theme.BackgroundKey("radialBackground", default:
				.surface(radialSurface, highlight: .overlayHighlightAccent)
		)
		
		Text("Radial Gradient")
			.theme(padding: .cardPadding)
			.theme(color: .foregroundOnBackground)
			.theme(text: .cardTitle)
			.theme(background: radialBackground, highlighted: false)
		
	}
	
}
