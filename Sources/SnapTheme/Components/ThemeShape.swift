//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

public struct ThemeShape: View {
	
	public struct Configuration {
		
		public init(shape: ThemeShape.Style = .rectangle(), fill: Theme.SurfaceKey? = nil, stroke: ThemeShape.Stroke? = nil) {
			self.shape = shape
			self.fill = fill
			self.stroke = stroke
		}
		
		public let shape: Style
		public let fill: Theme.SurfaceKey?
		public let stroke: Stroke?
		
	}
	
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
	
	public struct Stroke {
		public let fill: Theme.SurfaceKey
		public let lineWidth: Theme.NumberKey
	}

	@Environment(\.self) var environment
	@Environment(\.theme) private var theme
	@ScaledMetric private var scaleFactor: CGFloat = 1

	public let configuration: Configuration

	public init(_ shape: Style?, fill: Theme.SurfaceKey? = nil, stroke: Stroke? = nil) {
		self.configuration = Configuration(shape: shape ?? .rectangle(), fill: fill, stroke: stroke)
	}
	
	public var body: some View {
		
		let fill = theme.shapeStyleForSurface(key: configuration.fill, in: environment) ?? Color.clear
		let stroke = theme.shapeStyleForSurface(key: configuration.stroke?.fill, in: environment) ?? Color.clear
		let strokeWidth = theme.number(configuration.stroke?.lineWidth, scaled: scaleFactor)
		
		return AnyShape(shapeView)
			.fill(AnyShapeStyle(fill))
			.stroke(AnyShapeStyle(stroke), lineWidth: strokeWidth ?? 0)

	}
	
	private var shapeView: any Shape {
		return shapeViewWith(scaleFactor: scaleFactor, in: theme)
	}
	
	/// Generate the `Shape` without being installed on a View
	/// Prevents warning: `Accessing Environment<CGFloat>'s value outside of being installed on a View. This will always read the default value and will not update.`
	internal func shapeViewWith(scaleFactor: CGFloat, in theme: Theme) -> any Shape {
		switch configuration.shape {
				
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
					.theme(surface: .accentBackground)
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
