//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
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
			.theme(padding: top, .top)
			.theme(padding: inset, .leading)
		
	}
	
}


// MARK: - Preview

#Preview {
	
	ThemeScreen {
		
		Section {
			Text("Section Content")
				.frame(maxWidth: .infinity, alignment: .leading)
		} header: {
			ThemeSectionHeaderContainer {
				ThemeLabel(text: "Section Header Container")
					.labelStyle(.themeSectionHeader(textCase: .uppercase))
			}
			.theme(background: .screen)
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
			.theme(background: .screen)
		}
		
		
	}
	
}


