//
//  ThemeListRowBackground.swift
//  
//
//  Created by Simon Nickel on 16.11.23.
//

import SwiftUI

public extension View {
	
	/// Applies background registered for `BackgroundKey` as `.listRowBackground`.
	/// - Parameter background: `BackgroundKey` to apply.
	/// - Returns: Modified view.
	func theme(listRowBackground: Theme.BackgroundKey, highlighted: Bool = false, shape: ThemeShape.Style? = nil) -> some View {
		return self.modifier(Theme.ThemeListRowBackground(background: listRowBackground, highlighted: highlighted, shape: shape))
	}
	
}


// MARK: - View Modifier

private extension Theme {
	
	struct ThemeListRowBackground: ViewModifier {
		@Environment(\.theme) private var theme
		
		let background: Theme.BackgroundKey
		let highlighted: Bool
		let shape: ThemeShape.Style?
		
		public func body(content: Content) -> some View {
			let backgroundView = theme.background(for: background, highlighted: highlighted)
			
			return content
				.if(unwrap: backgroundView, transform: { view, backgroundView in
					view.listRowBackground(ThemeListRowBackgroundContainer {
						AnyView(backgroundView)
							.if(unwrap: shape, transform: { view, shape in
								view.mask {
									ThemeShape(shape)
								}
							})
					})
				})
		}
	}
	
	/// On macOS the background needs a horizontal padding. 
	private struct ThemeListRowBackgroundContainer<Content: View>: View {
		
		@ViewBuilder let content: () -> Content
		
		var body: some View {
			VStack {
				content()
#if os(macOS)
					.theme(padding: .sidebarMacOSBackgroundPaddingHorizontal, .horizontal)
#endif
			}
		}
	}
	
}
