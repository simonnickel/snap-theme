//
//  ThemeElement.swift
//  SnapTheme
//
//  Created by Simon Nickel on 03.12.23.
//

import SwiftUI
import SnapCore

public struct ThemeElement<Content: View>: View {
	
	
	/// A convenience container to apply common theme attributes.
	/// - Parameters:
	///   - shape: `ThemeShape.Style` of the view,
	///   - padding: `Theme.ValueKey` to apply as padding.
	///   - color: `Theme.ColorKey` to apply as foreground.
	///   - background: `Theme.BackgroundKey` to use as background.
	///   - highlighted: If `true`, the highlight configured in the background is applied (animated).
	///   - content: The content view to present in the element.
	public init(shape: ThemeShape.Style? = nil, padding: Theme.ValueKey? = nil, color: Theme.ColorKey? = nil, background: Theme.BackgroundKey? = nil, highlighted: Bool = false, @ViewBuilder content: @escaping () -> Content) {
		self.shape = shape
		self.padding = padding
		self.color = color
		self.background = background
		self.highlighted = highlighted
		self.content = content
	}
	
	private let shape: ThemeShape.Style?
	private let padding: Theme.ValueKey?
	private let color: Theme.ColorKey?
	private let background: Theme.BackgroundKey?
	private let highlighted: Bool
	
	@ViewBuilder private let content: () -> Content
	
	public var body: some View {
		ThemeVStack {
			content()
		}
		.if(unwrap: padding, transform: { view, padding in
			view.theme(padding: padding)
		})
		.if(unwrap: background, transform: { view, background in
			view.theme(background: background, highlighted: highlighted)
		})
		.if(unwrap: color, transform: { view, color in
			view.theme(color: color)
		})
		.if(unwrap: shape, transform: { view, shape in
			view.mask {
				ThemeShape(shape)
			}
		})
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
			
			ThemeElement(padding: .spacingElements, background: .contentSecondary) {
				Text("Content Secondary")
			}
			.environment(\.highlighted, false)
			
			ThemeElement(padding: .spacingElements, background: .contentSecondary) {
				Text("Content Secondary, highlighted via Env")
			}
			.environment(\.highlighted, true)
			
		}
		
	}
	
}

