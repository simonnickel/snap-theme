//
//  ThemeBackground.swift
//  SnapTheme
//
//  Created by Simon Nickel on 29.06.23.
//

import SwiftUI
import SnapCore

public extension View {
	
	/// Applies background registered for `BackgroundKey`.
	/// - Parameter background: `BackgroundKey` to apply.
	/// - Parameter highlighted: If `true` the highlight of the background is activated (animated).
	/// - Parameter ignoreSafeArea: Applies `.ignoresSafeArea()` to background if `true`.
	/// - Returns: Modified view.
	func theme(background: Theme.BackgroundKey, highlighted: Bool = false, ignoreSafeArea: Bool = false) -> some View {
		return self.modifier(Theme.ThemeBackground(background: background, highlighted: highlighted, ignoreSafeArea: ignoreSafeArea))
	}
	
	/// Applies background registered for `BackgroundKey` as `.toolbarBackground` for given placement.
	/// - Parameter background: `BackgroundKey` to apply.
	/// - Parameter placement: `ToolbarPlacement` to apply the background to.
	/// - Returns: Modified view.
	func theme(toolbarBackground: Theme.BackgroundKey, placement: ToolbarPlacement) -> some View {
		return self.modifier(Theme.ThemeToolbarBackground(background: toolbarBackground, placement: placement))
	}
	
	/// Applies color registered for `ColorKey` as `.background`.
	/// Consider using `.theme(background:)` with `BackgroundKey` instead.
	/// - Parameter background: `ColorKey` to apply.
	/// - Returns: Modified view.
	func theme(backgroundColor: Theme.ColorKey) -> some View {
		return self.modifier(Theme.ThemeBackgroundColor(background: backgroundColor))
	}
	
}


// MARK: - View Modifier

private extension Theme {
	
	struct ThemeBackground: ViewModifier {
		@Environment(\.theme) private var theme
		@Environment(\.highlighted) private var highlightedEnvironment
		
		let background: Theme.BackgroundKey
		let highlighted: Bool
		let ignoreSafeArea: Bool
		
		public func body(content: Content) -> some View {
			let backgroundView = theme.background(for: background, highlighted: highlighted || highlightedEnvironment)
			return content
				.if(unwrap: backgroundView, transform: { view, backgroundView in
					view.background {
						AnyView(backgroundView)
							.if(ignoreSafeArea, transform: { view in
								view.ignoresSafeArea()
							})
					}
					.animation(.default, value: self.highlighted)
				})
		}
	}
	
	struct ThemeToolbarBackground: ViewModifier {
		@Environment(\.self) var environment
		@Environment(\.theme) private var theme
		
		var background: Theme.BackgroundKey
		var placement: ToolbarPlacement
		
		public func body(content: Content) -> some View {
			let shapeStyle = theme.shapeStyle(for: background, in: environment)
			return content
				.if(unwrap: shapeStyle, transform: { view, shapeStyle in
					view.toolbarBackground(AnyShapeStyle(shapeStyle), for: placement)
				})
		}
	}
	
	/// View Modifier to apply the color registered for `ColorKey` from the theme in environment as `.background`.
	struct ThemeBackgroundColor: ViewModifier {
		@Environment(\.self) var environment
		@Environment(\.theme) private var theme
		
		var background: Theme.ColorKey
		
		public func body(content: Content) -> some View {
			return content.background(theme.color(for: background, in: environment))
		}
	}
	
}


// MARK: - Preview

#Preview {
	
	let materialSurface = Theme.SurfaceKey("materialSurface", default: .material(.ultraThin))
	let materialBackground = Theme.BackgroundKey("materialBackground", default: .surface(materialSurface, highlight: .overlayHighlightAccent))
	
	let gradientSurface = Theme.SurfaceKey("gradientSurface", default: .gradient(.angular([.accentPrimary, .accentComplimentary, .accentPrimary, .accentComplimentary, .accentComplimentary, .accentPrimary], center: .center, angle: .zero)))
	let gradientBackground = Theme.BackgroundKey("gradientBackground", default: .surface(gradientSurface, highlight: .overlayHighlightAccent))
	
	return ThemePreviewContainer(.screen, padding: nil) {
		
		ZStack {
			
			HStack(spacing: 0) {
				
				ForEach(0..<4) { _ in
					Rectangle().fill(.red)//.fill(Color(white: 0.1))
					Rectangle().fill(Color(white: 0.9))
				}
				
			}
			
			ThemeVStack {
				
				Text("Background .content")
					.theme(padding: .cardPadding)
					.theme(background: .content)
				
				Text("Background .content, highlighted")
					.theme(padding: .cardPadding)
					.theme(background: .content, highlighted: true)

				Text("Background .accent")
					.theme(padding: .cardPadding)
					.theme(color: .foregroundOnBackground)
					.theme(background: .accent)
				
				Text("Background .accent, highlighted")
					.theme(padding: .cardPadding)
					.theme(color: .foregroundOnBackground)
					.theme(background: .accent, highlighted: true)
				
				Text("Background .interactive")
					.theme(padding: .cardPadding)
					.theme(color: .foregroundOnBackground)
					.theme(background: .interactive)
				
				Text("Background .interactive, highlighted")
					.theme(padding: .cardPadding)
					.theme(color: .foregroundOnBackground)
					.theme(background: .interactive, highlighted: true)
				
				Text("Background Color .accentPrimary")
					.theme(padding: .cardPadding)
					.theme(color: .foregroundOnBackground)
					.theme(backgroundColor: .accentPrimary)
				
				Text("Background Material")
					.theme(padding: .cardPadding)
					.theme(color: .foregroundOnBackground)
					.theme(background: materialBackground, highlighted: false)
				
				Text("Background Material Highlighted")
					.theme(padding: .cardPadding)
					.theme(color: .foregroundOnBackground)
					.theme(background: materialBackground, highlighted: true)
				
				Text("Gradient")
					.theme(padding: .cardPadding)
					.theme(color: .foregroundOnBackground)
					.theme(background: gradientBackground, highlighted: false)
				
			}
			.theme(padding: .cardPadding)
			
		}
		
	}
	
}
