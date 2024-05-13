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
	func theme(listRowBackground: Theme.BackgroundKey?, highlighted: Bool = false, shape: ThemeShape.Style? = nil) -> some View {
		return self.modifier(Theme.ThemeListRowBackground(background: listRowBackground, highlighted: highlighted, shape: shape))
	}
	
}


// MARK: - View Modifier

private extension Theme {
	
	struct ThemeListRowBackground: ViewModifier {
		@Environment(\.theme) private var theme
		
		let background: Theme.BackgroundKey?
		let highlighted: Bool
		let shape: ThemeShape.Style?
		
		public func body(content: Content) -> some View {
			let backgroundView: (AnyView)?
			if let background, let view = theme.backgroundView(key: background, shape: nil, stroke: nil, highlighted: highlighted) {
				backgroundView = AnyView(ThemeListRowBackgroundContainer {
					AnyView(view)
						.if(unwrap: shape, transform: { view, shape in
							view.mask {
								ThemeShape(shape)
							}
						})
				})
			} else {
				backgroundView = nil
			}
			
			return content
				.listRowBackground(backgroundView)
		}
	}
	
	/// On macOS the background needs a horizontal padding. 
	private struct ThemeListRowBackgroundContainer<Content: View>: View {
		
		@ViewBuilder let content: () -> Content
		
		var body: some View {
			VStack {
				content()
#if os(macOS) // TODO macOS: Is it different between sidebar and normal list styles?
					.theme(padding: .sidebarMacOSBackgroundPaddingHorizontal, .horizontal)
#endif
			}
		}
	}
	
}
