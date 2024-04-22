//
//  ThemeSceneBaseModifier.swift
//  SnapTheme
//
//  Created by Simon Nickel on 04.11.23.
//

import SwiftUI

public extension Theme {
	
	struct ThemeSceneBaseModifier: ViewModifier {
		
		public struct Model {
			
			public let title: String?
			public let titleMode: ToolbarTitleDisplayMode
			public let background: Theme.BackgroundKey?
			
		}
		
		@Environment(\.theme) private var theme
		
		let data: Model
		
		public func body(content: Content) -> some View {
			
			return content
			
			// Title
				.if(unwrap: data.title, transform: { view, title in
					view.navigationTitle(title)
				})
			
			// Title Display Mode
				.toolbarTitleDisplayMode(data.titleMode)
			
			// Background
				.if(unwrap: data.background, transform: { view, background in
					view.theme(background: background, ignoreSafeArea: true)
				})
			
			// Toolbar Background
			// .automatic is .windowToolbar on macOS and .navigationBar on iOS
		#if os(macOS)
				.theme(toolbarBackground: .barNavigation, placement: .windowToolbar)
		#else
				.theme(toolbarBackground: .barNavigation, placement: .navigationBar)
				.theme(toolbarBackground: .barBottom, placement: .bottomBar)
				.theme(toolbarBackground: .barTab, placement: .tabBar)
		#endif
			
			// TODO idea: Could be a config on theme.
			// FB13322408: Force visible navigation bar
			// iOS: .toolbarBackground(.visible, for: .automatic)
			// macOS: .scrollContentBackground(.hidden)
			
		}
	}
	
}
