//
//  ThemeScreen.swift
//  SnapTheme
//
//  Created by Simon Nickel on 04.11.23.
//

import SwiftUI

// TODO idea: Define default TitleDisplayMode in theme.

extension ThemeScreen where Content : View {
	
	/// Layout options of a `ThemeScreen`.
	public enum Style {
		case plain, scrollView
		public static var defaultCase: Self { .scrollView }
	}
	
}

/// A `Screen` represents an independent arrangement of Views that is displayed in a `Scene`, see [Conventions.md](https://github.com/simonnickel/snap-abstract/blob/main/Conventions.md).
/// ``ThemeScreen``, ``ThemeScreenList``, ``ThemeScreenSidebar`` are convenience views to set basic attributes and setup the Content to use the `Theme`.
/// Use:
///  - `Screen(style: .plain)` for the Content as the screen.
///  - `Screen()` to place the Content in a `ScrollView`.
///  - `ThemeScreenList()` to place the Content in a `ListView`.
///  - `ThemeScreenSidebar()` to place the Content in a `ListView` with style `.sidebar`.
public struct ThemeScreen<Content>: View where Content : View {
	
	@Environment(\.theme) private var theme
	
	public init(
		style: Style = .defaultCase,
		title: String? = nil,
		titleMode: ToolbarTitleDisplayMode = .automatic,
		background: Theme.BackgroundKey? = .screen,
		@ViewBuilder content: @escaping () -> Content
	) {
		self.style = style
		self.baseData = .init(title: title, titleMode: titleMode, background: background)
		self.content = content
	}
	
	private let style: Style
	private let baseData: Theme.ThemeScreenBaseModifier.Model
	private let content: () -> Content
	
	public var body: some View {
		
		let content = content()
			.frame(maxWidth: .infinity)
		
		Group {
			switch style {
					
				case .plain:
					content
					
				case .scrollView:
					ScrollView {
						content
							.scenePadding()
					}
					
			}
		}
		.modifier(Theme.ThemeScreenBaseModifier(data: baseData))

	}
	
}


// MARK: - Preview

#Preview {
	
	NavigationStack {
		
		ThemeScreen(title: "Scroll View") {
			ForEach(0..<2) { _ in
				Text("Some Content Text with a few Lorem Ipsum like words to fill the row showing the edge behaviour and maybe have a second row.")
					.themeCard(.content)
			}
		}
		
	}
	
}
