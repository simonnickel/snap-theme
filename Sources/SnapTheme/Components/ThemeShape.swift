//
//  ThemeShape.swift
//  SnapTheme
//
//  Created by Simon Nickel on 06.11.23.
//

import SwiftUI

public struct ThemeShape: View {
	
	public enum Style: Theme.KeyProtocolRequirements {
		
		/// A simple rectangle, e.g. to just have a colored area.
		case plane
		
		case rectangle(_ cornerRadius: Theme.NumberKey? = nil)
		
		case circle
		
		case capsule
		// case ellipse, unevenRoundedRectangle
		
		var description: String {
			switch self {
				case .plane: "Plane"
				case .rectangle(let cornerRadius): if let cornerRadius {
					"Rectangle, radius: .\(cornerRadius.id)"
				} else { "Rectangle" }
				case .circle: "Circle"
				case .capsule: "Capsule"
			}
		}
	}

	@Environment(\.self) var environment
	@Environment(\.theme) private var theme
	@ScaledMetric private var scaleFactor: CGFloat = 1

	public let shape: Style

	public init(_ shape: Style) {
		self.shape = shape
	}
	
	public var body: some View {
		
		return AnyShape(shapeView)

	}
	
	private var shapeView: any Shape {
		return shapeViewWith(scaleFactor: scaleFactor, in: theme)
	}
	
	/// Generate the `Shape` without being installed on a View
	/// Prevents warning: `Accessing Environment<CGFloat>'s value outside of being installed on a View. This will always read the default value and will not update.`
	internal func shapeViewWith(scaleFactor: CGFloat, in theme: Theme) -> any Shape {
		switch shape {
				
			case .plane: return Rectangle()
				
			case .rectangle(cornerRadius: let cornerRadius):
				let radius: CGFloat = if let cornerRadius {
					theme.number(cornerRadius, scaled: scaleFactor) ?? 0
				} else { 0 }
				
				return RoundedRectangle(cornerRadius: radius, style: .continuous)
				
			case .circle: return Circle()
				
			case .capsule: return Capsule()
		}
	}
	
}


// MARK: - Preview

#Preview {
	
	return ThemePreviewContainer(.view) {
		
		let shapes: [ThemeShape.Style] = [.rectangle(), .rectangle(.cornerRadiusElement), .circle, .capsule]
		
		ForEach(shapes, id: \.self) { shape in
			
			Section {
				ThemeShape(shape)
					.surface(.accentBackground)
					.frame(width: 200, height: 30)
			} header: {
				ThemeSectionHeaderContainer {
					ThemeLabel(text: shape.description)
						.labelStyle(.themeSectionHeader(prominent: true))
				}
			}
			
		}
		
	}
	
}
