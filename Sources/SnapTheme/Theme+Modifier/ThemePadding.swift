//
//  ThemePadding.swift
//  SnapTheme
//
//  Created by Simon Nickel on 30.06.23.
//

import SwiftUI

public extension View {
	
	/// View Modifier to set the padding by given `ValueKey`.
	/// - Parameters:
	///   - valueKey: `ValueKey` to apply as padding.
	///   - edges: `Edge.Set` the padding is applied to.
	/// - Returns: Modified View.
	func theme(padding valueKey: Theme.ValueKey, _ edges: Edge.Set = .all) -> some View {
		return self.modifier(Theme.ThemePadding(value: valueKey, edges: edges))
	}

}


// MARK: - View Modifier

private extension Theme {
	
	/// View Modifier to apply the padding for `ValueKey` from the theme in environment.
	/// - Scaled by DynamicType and the `.scale` value from the theme.
	struct ThemePadding: ViewModifier {
		@Environment(\.theme) private var theme
		@ScaledMetric private var scaleFactor: CGFloat = 1
		
		let value: Theme.ValueKey
		let edges: Edge.Set
		
		public func body(content: Content) -> some View {
			return content
				.padding(edges, theme.value(value, scaled: scaleFactor))
		}
	}
	
}


// MARK: - Preview

#Preview {
	
	ThemePreviewContainer(.view, theme: Theme(
		values: [
			.cardPadding : 20,
		],
		scale: 1.5
	)) {
		
		Text("Padding")
			.theme(padding: .cardPadding)
			.theme(color: .foregroundOnBackground)
			.theme(background: .accent)
		Text("Vertical")
			.theme(padding: .cardPadding, .vertical)
			.theme(color: .foregroundOnBackground)
			.theme(background: .accent)
		Text("Horizontal")
			.theme(padding: .cardPadding, .horizontal)
			.theme(color: .foregroundOnBackground)
			.theme(background: .accent)
		Text("Leading")
			.theme(padding: .cardPadding, .leading)
			.theme(color: .foregroundOnBackground)
			.theme(background: .accent)
		Text("Trailing")
			.theme(padding: .cardPadding, .trailing)
			.theme(color: .foregroundOnBackground)
			.theme(background: .accent)
		
	}

}
