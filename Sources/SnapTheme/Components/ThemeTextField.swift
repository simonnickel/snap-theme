//
//  ThemeTextField.swift
//  SnapTheme
//
//  Created by Simon Nickel on 12.01.24.
//

import SwiftUI
import SnapCore

public struct ThemeTextField: View {
	
	@Environment(\.self) private var environment
	@Environment(\.theme) private var theme
	
	public init(prompt: String, text: Binding<String>, font: Theme.FontKey? = .controlTextField, color: Theme.ColorKey? = nil, promptColor: Theme.ColorKey? = .placeholder) {
		self.prompt = prompt
		self.text = text
		self.font = font
		self.color = color
		self.promptColor = promptColor
	}
	
	private let prompt: String
	private let text: Binding<String>
	private let font: Theme.FontKey?
	private let color: Theme.ColorKey?
	private let promptColor: Theme.ColorKey?
	
	@State private var showClearButton: Bool = true
	
	public var body: some View {

		ThemeHStack(spacing: .spacingElements) {
			TextField(
				prompt,
				text: text,
				prompt: promptView
			)
			if showClearButton {
				AnyView(clearButton)
					.transition(.asymmetric(insertion: .push(from: .trailing), removal: .push(from: .leading))) // TODO: Animations as Theme Keys?
			}
		}
		.if(unwrap: font, transform: { view, font in
			view.theme(font: font)
		})
		.if(unwrap: color) { view, color in
			view.theme(color: color)
		}
		.onChange(of: text.wrappedValue, initial: true) { oldValue, newValue in
			withAnimation {
				showClearButton = newValue != ""
			}
		}
		
	}
	
	private var clearButton: any View {
		Button {
			text.wrappedValue = ""
		} label: {
			theme.icon(.textFieldClear).image
				.theme(color: .controlIndicator)
		}
	}
	
	private var promptView: Text {
		var text = Text(prompt)
		
		if let colorKey = promptColor {
			let color = theme.color(for: colorKey, in: environment)
			text = text.foregroundStyle(color)
		}
		
		return text
	}
	
}


// MARK: - Preview

#Preview {
	
	struct TextFieldWrapper: View {
		
		let prompt: String
		let promptColor: Theme.ColorKey?
		
		@State private var text: String = ""
		
		public var body: some View {
			ThemeTextField(prompt: prompt, text: $text, font: .controlTextFieldProminent, color: .accentPrimary, promptColor: promptColor)
		}
		
	}
	
	var text: String
	
	return ThemePreviewContainer(
		.view,
		theme: .base.replacingValues(
//			fonts: [
//				.controlTextField : .definition(.init(size: 20, weight: .bold))
//			]
		)
	) {
		
		Section {
			
			TextFieldWrapper(prompt: "Preview", promptColor: nil)
			TextFieldWrapper(prompt: "Preview", promptColor: .foregroundDisabled)
			
		} header: {
			ThemeSectionHeaderContainer {
				ThemeLabel(text: "ThemeTextField", style: .themeSectionHeader(prominent: true))
			}
		}
		
	}
	
}

