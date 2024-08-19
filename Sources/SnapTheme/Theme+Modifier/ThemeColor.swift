//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapCore

public extension View {
	
	/// Apply foreground color registered for `ColorKey`.
	/// - Parameter color: `Theme.ColorKey` to apply as `.foregroundStyle`.
	/// - Returns: Modified view.
	func theme(color: Theme.ColorKey) -> some View {
		return self.modifier(Theme.ThemeForegroundColor(color: color))
	}
	
	/// Apply surface registered for `SurfaceKey` as  foreground.
	/// - Parameter surface: `Theme.SurfaceKey` to apply as `.foregroundStyle`.
	/// - Returns: Modified view.
	func theme(surface: Theme.SurfaceKey) -> some View {
		return self.modifier(Theme.ThemeForegroundSurfaceWithKey(surface: surface))
	}
	
	/// Apply surface as foreground.
	/// - Parameter surface: `Theme.SurfaceValue` to apply as `.foregroundStyle`.
	/// - Returns: Modified view.
	func theme(surface: Theme.SurfaceValue) -> some View {
		return self.modifier(Theme.ThemeForegroundSurfaceWithValue(surface: surface))
	}
	
	/// Apply tint color registered for `ColorKey`.
	/// - Parameter color: `Theme.ColorKey` to apply as `.tint`.
	/// - Returns: Modified view.
	func theme(tint: Theme.ColorKey) -> some View {
		return self.modifier(Theme.ThemeTintColor(color: tint))
	}
	
}


// MARK: - View Modifier

public extension Theme {
	
	/// View Modifier to apply the color registered for `Theme.ColorKey` from the theme in environment as `.foregroundStyle`.
	struct ThemeForegroundColor: ViewModifier {
		@Environment(\.self) private var environment
		@Environment(\.theme) private var theme
		
		var color: Theme.ColorKey
		
		public func body(content: Content) -> some View {
			let shapeStyle = theme.shapeStyleForColor(key: color, in: environment)
			return AnyView(content
				.foregroundStyle(shapeStyle))
		}
	}
	
	/// View Modifier to apply the surface in environment as `.foregroundStyle`.
	struct ThemeForegroundSurfaceWithValue: ViewModifier {
		@Environment(\.self) private var environment
		@Environment(\.theme) private var theme
		
		var surface: Theme.SurfaceValue
		
		public func body(content: Content) -> some View {
			let shapeStyle = theme.shapeStyleForSurface(value: surface, in: environment)
			var colorSchemeOverride: ColorScheme? = nil
			switch surface {
				case .material(_, let colorScheme): colorSchemeOverride = colorScheme?.system
				default: break
			}
			return content
				.if(unwrap: shapeStyle, transform: { view, shapeStyle in
					view.foregroundStyle(AnyShapeStyle(shapeStyle))
				})
				.if(unwrap: colorSchemeOverride) { view, override in
					view.environment(\.colorScheme, override)
				}
		}
	}
	
	/// View Modifier to apply the surface registered for `Theme.SurfaceKey` from the theme in environment as `.foregroundStyle`.
	struct ThemeForegroundSurfaceWithKey: ViewModifier {
		@Environment(\.self) private var environment
		@Environment(\.theme) private var theme
		
		var surface: Theme.SurfaceKey
		
		public func body(content: Content) -> some View {
			let surfaceValue = theme.surfaceValue(for: surface)
			
			return content
				.modifier(ThemeForegroundSurfaceWithValue(surface: surfaceValue))
		}
	}
	
	/// View Modifier to apply the color registered for `Theme.ColorKey` from the theme in environment as `.tint`.
	struct ThemeTintColor: ViewModifier {
		@Environment(\.self) private var environment
		@Environment(\.theme) private var theme
		
		var color: Theme.ColorKey
		
		public func body(content: Content) -> some View {
			let color = theme.color(for: color, in: environment)
			return content
				.tint(color)
		}
	}
	
}


// MARK: - Preview

#Preview {
	
	VStack {
		Text("Test")
	}
	.theme(padding: .spacingElements)
	.theme(color: .accentPrimary)
	.theme(background: .screen)
	
}
