//
//  OverlayCardIndicator.swift
//  SnapTheme
//
//  Created by Simon Nickel on 09.06.23.
//

import SwiftUI
import SnapCore


// MARK: - View Modifier

public extension View {

	/// Overlays the View with an Icon to indicate some State (e.g. selection).
	/// Styled with given Configuration of Theme Keys.
	///
	/// - Parameters:
	///   - configuration: Theme Keys to style the Icon appearance.
	///   - onResize: Handle icon size changes, e.g. to adapt layout around the icon.
	/// - Returns: The modified View.
	func overlayCardIndicator(_ configuration: CardIndicator.Configuration, onResize: CardIndicator.ResizeHandler?) -> some View {
		return self.modifier(CardIndicator(configuration: configuration, onResize: onResize))
	}
	
}

public struct CardIndicator: ViewModifier {
	
	public typealias ResizeHandler = (_ size: CGSize) -> Void
	
	@Environment(\.theme) private var theme
	@ScaledMetric private var scaleFactor: CGFloat = 1
	
	public struct Configuration {
		public init(icon: Theme.IconKey, font: Theme.FontKey = .cardIndicator, color: Theme.ColorKey = .foregroundOnBackground, opacity: Double = 1) {
			self.icon = icon
			self.font = font
			self.color = color
			self.opacity = opacity
		}
		
		let icon: Theme.IconKey
		let font: Theme.FontKey
		let color: Theme.ColorKey
		let opacity: Double
	}
	
	let configuration: Configuration
	let onResize: ResizeHandler?
	
	public func body(content: Content) -> some View {
		
		return content.overlay { // Overlay the Icon is placed in.
			
			VStack(alignment: .trailing) { // Stack to align the Icon.
				
				theme.icon(configuration.icon).image
					.opacity(configuration.opacity)
					.theme(font: configuration.font)
					.theme(color: configuration.color)
					.padding([.trailing, .bottom], (theme.number(.cardPadding, scaled: scaleFactor) ?? 0) * 3 / 5)
					.overlay { // Overlay to read the actual icon size.
						
						GeometryReader { reader in
							Rectangle()
								.opacity(0)
								.frame(maxWidth: .infinity, maxHeight: .infinity)
								.preference(key: GeometryViewSizeKey.self, value: reader.size)
						}
						.onPreferenceChange(GeometryViewSizeKey.self) { size in
							onResize?(size)
						}
						
					}
				
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
			
		}
	}
}


// MARK: - Preview

#Preview {
	
	VStack {
		Rectangle()
			.frame(width: 100, height: 100)
			.padding([.bottom], 40)
	}
	.themeCard(.accent)
	.overlayCardIndicator(.init(icon: .cardIndicatorEnabled), onResize: { size in })
	
}
