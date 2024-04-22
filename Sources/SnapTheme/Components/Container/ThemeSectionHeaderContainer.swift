//
//  ThemeSectionHeaderContainer.swift
//  SnapTheme
//
//  Created by Simon Nickel on 07.09.23.
//

import SwiftUI

// TODO idea: ThemeStructuredSection: A container that applies ThemeSectionHeaderContainer to the header and footer styles to the footer.
// Replace all usage of ThemeSectionHeaderContainer

public struct ThemeSectionHeaderContainer<Content: View>: View {
	
	public init(top: Theme.NumberKey? = .spacingSections, inset: Theme.NumberKey? = nil, @ViewBuilder content: @escaping () -> Content) {
		self.top = top
		self.inset = inset
		self.content = content
	}
	
	@ViewBuilder private let content: () -> Content
	private let top: Theme.NumberKey?
	private let inset: Theme.NumberKey?
	
	public var body: some View {
		
		content()
			.frame(maxWidth: .infinity, alignment: .leading)
			.if(unwrap: top, transform: { view, top in
				view.theme(padding: top, .top)
			})
			.if(unwrap: inset, transform: { view, insetKey in
				view.theme(padding: insetKey, .leading)
			})
		
	}
	
}


// MARK: - Preview

#Preview {
	
	ThemeScene {
		
		Section {
			Text("Section Content")
				.frame(maxWidth: .infinity, alignment: .leading)
		} header: {
			ThemeSectionHeaderContainer {
				ThemeLabel(text: "Section Header Container")
					.labelStyle(.themeSectionHeader(textCase: .uppercase))
			}
			.theme(background: .scene)
		}
		
		Section {
			Text("Section Content")
				.frame(maxWidth: .infinity, alignment: .leading)
				.themeCard()
		} header: {
			ThemeSectionHeaderContainer(inset: .cardPadding) {
				ThemeLabel(text: "Section Header Container")
					.labelStyle(.themeSectionHeader(textCase: .uppercase))
			}
			.theme(background: .scene)
		}
		
		
	}
	
}


