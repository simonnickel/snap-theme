//
//  ThemeScene.swift
//  SnapTheme
//
//  Created by Simon Nickel on 04.11.23.
//

import SwiftUI

// TODO idea: Define default TitleDisplayMode in theme.

public struct ThemeScene<Content>: View where Content : View {
	
	public enum Style {
		case plain, scrollView
		public static var defaultCase: Style { .scrollView }
	}
	
	@Environment(\.theme) private var theme
	
	public init(
		style: Style = .defaultCase,
		title: String? = nil,
		titleMode: ToolbarTitleDisplayMode = .automatic,
		background: Theme.BackgroundKey? = .scene,
		@ViewBuilder content: @escaping () -> Content
	) {
		self.style = style
		self.baseData = .init(title: title, titleMode: titleMode, background: background)
		self.content = content
	}
	
	private let style: Style
	private let baseData: Theme.ThemeSceneBaseModifier.Model
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
		.modifier(Theme.ThemeSceneBaseModifier(data: baseData))

	}
	
}


// MARK: - Preview

#Preview {
	
	NavigationStack {
		
		ThemeScene(title: "Scroll View") {
			ForEach(0..<2) { _ in
				Text("Some Content Text with a few Lorem Ipsum like words to fill the row showing the edge behaviour and maybe have a second row.")
					.themeCard(.content)
			}
		}
		
	}
	
}
