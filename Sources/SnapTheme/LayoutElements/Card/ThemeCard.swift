//
//  ThemeCard.swift
//  SnapTheme
//
//  Created by Simon Nickel on 27.04.23.
//

import SwiftUI
import SnapCore

public extension Theme {
	
	/// A dummy type to define some attributes.
	struct Card {}
	
}


// MARK: - ThemeCard

public struct ThemeCard<Content: View>: View {
	
	public init(style: Theme.Card.Style = .content, level: Theme.Card.Level = .ground, highlighted: Bool = false, content: @escaping () -> Content) {
		self.style = style
		self.level = level
		self.content = content
		self.highlighted = highlighted
	}
	
	let style: Theme.Card.Style
	let level: Theme.Card.Level
	let highlighted: Bool
	
	@ViewBuilder let content: () -> Content
	
	public var body: some View {
		content()
			.themeCard(style, level: level, highlighted: highlighted)
	}
	
}


// MARK: - View Modifier

public extension View {
	
	func themeCard(_ style: Theme.Card.Style = .content, level: Theme.Card.Level = .ground, highlighted: Bool = false) -> some View {
		return self.modifier(Theme.ThemeCard(style: style, level: level, highlighted: highlighted))
	}
	
}

private extension Theme {
	
	struct ThemeCard: ViewModifier {
		
		@Environment(\.theme) private var theme
		
		let style: Theme.Card.Style
		let level: Theme.Card.Level
		let highlighted: Bool
		
		public func body(content: Content) -> some View {
			ThemeElement(
				shape: .rectangle(level.cornerRadius),
				padding: .cardPadding,
				color: style.foreground,
				background: style.backgroundKey(in: theme),
				highlighted: highlighted
			) {
				content
			}
		}
		
	}
	
}


// MARK: - Preview

#Preview {
	
	ThemePreviewContainer(.screen) {
		
		VStack(alignment: .leading) {
			Text("ThemedCard")
				.theme(font: .cardTitle)
			Text("Default")
				.theme(font: .cardBlock)
				.theme(color: .foregroundSecondary)
		}
		.themeCard()
	
		VStack(alignment: .leading) {
			Text("ThemedCard")
				.theme(font: .cardTitle)
			Text("Style .content")
				.theme(font: .cardBlock)
				.theme(color: .foregroundSecondary)
		}
		.themeCard(.content)
		
		VStack(alignment: .leading) {
			Text("ThemedCard")
				.theme(font: .cardTitle)
			Text("Style .accent")
				.theme(font: .cardBlock)
		}
		.themeCard(.accent)
		
		VStack(alignment: .leading) {
			Text("ThemedCard")
				.theme(font: .cardTitle)
			Text("Style .customBackground")
				.theme(font: .cardBlock)
		}
		.themeCard(.custom(color: .foreground, background: .content))
		
		ThemeCard() {
			ThemeCard(
				style: .accent,
				level: .first
			) {
				Text("Card on Card")
					.theme(font: .cardTitle)
			}
		}
		
	}
	
}
