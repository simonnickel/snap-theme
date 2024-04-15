//
//  ThemeButtonStyle.swift
//  SnapTheme
//
//  Created by Simon Nickel on 20.09.23.
//

import SwiftUI
import SnapCore

extension ButtonStyle where Self == ThemeButtonStyle {
	
	/// No shape, no background, forwards pressed state to Environment (`\.highlighted`).
	public static var themePlain: ThemeButtonStyle {
		ThemeButtonStyle()
	}
	
	/// Applies shape, without background, forwards pressed state to Environment (`\.highlighted`).
	public static var themeShape: ThemeButtonStyle {
		ThemeButtonStyle(shape: .capsule)
	}
	
	/// Applies shape with `.buttonPrimary` background, forwards pressed state to Environment (`\.highlighted`).
	public static var themePrimary: ThemeButtonStyle {
		ThemeButtonStyle(shape: .capsule, background: .buttonPrimary)
	}
	
	/// Applies shape with `.buttonSecondary` background, forwards pressed state to Environment (`\.highlighted`).
	public static var themeSecondary: ThemeButtonStyle {
		ThemeButtonStyle(shape: .capsule, background: .buttonSecondary)
	}
	
	/// Applies shape with `.buttonDestructive` background, forwards pressed state to Environment (`\.highlighted`).
	public static var themeDestructive: ThemeButtonStyle {
		ThemeButtonStyle(shape: .capsule, background: .buttonDestructive)
	}
	
}


// MARK: - ThemeButtonStyle

/// A `ButtonStyle` that assignes a shape and background and forwards pressed state to Environment (`\.highlighted`).
public struct ThemeButtonStyle: ButtonStyle {
	
	@Environment(\.theme) private var theme
	
	/// Button Style using `Theme.BackgroundKey`.
	/// - Parameters:
	///   - background: `Theme.BackgroundKey` to apply as background.
	public init(shape: ThemeShape.Style? = nil, background: Theme.BackgroundKey? = nil) {
		self.shape = shape
		self.background = background
	}
	
	private let shape: ThemeShape.Style?
	private let background: Theme.BackgroundKey?
	
	public func makeBody(configuration: Configuration) -> some View {
		
		ThemeElement(
			shape: shape,
			background: background
		) {
			configuration.label
		}
		.environment(\.highlighted, configuration.isPressed)
		
	}
	
}


// MARK: - Preview

#Preview {
	
	ThemePreviewContainer(.view) {

		Button(action: {}) {
			ThemeLabel(text: "Theme Plain", icon: .favorite)
				.labelStyle(.themeButtonPrimary)
				.theme(background: .contentSecondary)
		}
		.buttonStyle(.themePlain)

		Button(action: {}) {
			ThemeLabel(text: "Theme Primary", icon: .favorite)
				.labelStyle(.themeButtonPrimary)
		}
		.buttonStyle(.themePrimary)
		
		Button(action: {}) {
			ThemeLabel(text: "Theme Secondary", icon: .favorite)
				.labelStyle(.themeButtonSecondary)
		}
		.buttonStyle(.themeSecondary)
		
		Button(action: {}) {
			ThemeLabel(text: "Theme Destructive", icon: .favorite)
				.labelStyle(.themeButtonPrimary)
		}
		.buttonStyle(.themeDestructive)
		
	}
	
}
