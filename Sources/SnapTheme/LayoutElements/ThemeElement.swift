//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapCore

/// A convenience container to apply common theme attributes.
public struct ThemeElement<Content: View>: View {
	
	/// `ThemeElement` is a convenience container to apply common theme attributes:
	/// - Parameters:
	///   - shape: `ThemeShape.Style` of the view,
	///   - padding: `Theme.NumberKey` to apply as padding.
	///   - color: `Theme.ColorKey` to apply as foreground.
	///   - background: `Theme.BackgroundKey` to use as background.
	///   - highlighted: If `true`, the highlight configured in the background is applied (animated).
	///   - content: The content view to present in the element.
	public init(shape: ThemeShape.Style? = nil, stroke: ThemeShape.Stroke? = nil, padding: Theme.NumberKey? = nil, color: Theme.ColorKey? = nil, background: Theme.BackgroundKey? = nil, highlighted: Bool = false, @ViewBuilder content: @escaping () -> Content) {
		self.shape = shape
		self.stroke = stroke
		self.padding = padding
		self.color = color
		self.background = background
		self.highlighted = highlighted
		self.content = content
	}
	
	private let shape: ThemeShape.Style?
	private let stroke: ThemeShape.Stroke?
	private let padding: Theme.NumberKey?
	private let color: Theme.ColorKey?
	private let background: Theme.BackgroundKey?
	private let highlighted: Bool
	
	@ViewBuilder private let content: () -> Content
	
	public var body: some View {
		ThemeVStack {
			content()
		}
		.theme(padding: padding)
		.theme(background: background, shape: shape, stroke: stroke, highlighted: highlighted)
		.if(unwrap: color, transform: { view, color in
			view.theme(color: color)
		})
		.environment(\.highlighted, highlighted)
	}
	
}


// MARK: - Preview

#Preview {
	
	ThemePreviewContainer(.view) {
		
		Section {

			ThemeElement(shape: .rectangle(.cardCornerRadiusGround)) {
				Rectangle()
			}
			
			ThemeElement(shape: .circle, padding: .spacingElements, color: .foregroundOnBackground, background: .accent) {
				Text("Some Shape")
			}
			ThemeElement(shape: .circle, stroke: .init(fill: .uiIndicator, lineWidth: .spacingElements), padding: .spacingElements, color: .foregroundOnBackground, background: .accent) {
				Text("Some Shape")
			}
			
			ThemeElement(stroke: .init(fill: .accentGradientBackground, lineWidth: .spacingElements), padding: .spacingElements, background: .contentSecondary) {
				Text("Content Secondary")
			}
			
			ThemeElement(padding: .spacingElements, background: .contentSecondary, highlighted: true) {
				Text("Content Secondary, highlighted")
			}
			
			ThemeElement(shape: .capsule, stroke: .init(fill: .accentGradientForeground, lineWidth: .spacingElements), padding: .spacingGroups, color: .foregroundOnBackground, background: .buttonPrimary) {
				Text("Some Shape")
			}
			
		}
		
	}
	
}

