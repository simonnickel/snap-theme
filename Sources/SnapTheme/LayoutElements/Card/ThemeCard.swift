//
//  ThemeCard.swift
//  SnapTheme
//
//  Created by Simon Nickel on 27.04.23.
//

import SwiftUI
import SnapCore

public extension Theme {
	
	/// A dummy type to define some nested types. ThemeCard can not be extended because of generic attribute.
	struct Card {}
	
}


// MARK: - ThemeCard

/// A convenience layout container to show the Content in a card style box. Based on ``ThemeElement``.
public struct ThemeCard<Content: View>: View {
	
	/// `ThemeCard` is a convenience layout container to show the Content in a card style box.
	/// - Parameters:
	///   - style: Style of the card.
	///   - level: Level of card if placed in another card.
	///   - highlighted: Highlight state.
	///   - content: The Content to place in the container.
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
	
	/// A convenience layout ViewModifier to show the Content in a card style box. Based on ``ThemeElement``.
	/// - Parameters:
	///   - style: Style of the card.
	///   - level: Level of card if placed in another card.
	///   - highlighted: Highlight state.
	/// - Returns: The modified View.
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
				background: style.backgroundKey(for: level, in: theme),
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
				level: .first
			) {
				Text("Card on Card")
					.theme(font: .cardTitle)
			}
		}
		
		ThemeCard() {
			ThemeCard(
				style: .accent,
				level: .first
			) {
				Text("Card on Card")
					.theme(font: .cardTitle)
			}
		}
		
		ThemeCard(
			style: .accent
		) {
			ThemeCard(
				style: .accentStack,
				level: .first
			) {
				Text("Card on Card")
					.theme(font: .cardTitle)
			}
		}
		
	}
	
}
