//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

public struct ThemeEmptyDecorationView: View {
	
	@Environment(\.theme) private var theme
	
	public init(text: String, icon: Theme.IconKey = .emptyScreenDecoration) {
		self.text = text
		self.icon = icon
	}
	
	private let icon: Theme.IconKey
	private let text: String
	
	public var body: some View {
		
		ThemeVStack(spacing: .spacingGroups) {
			
			theme.icon(icon).image
				.theme(text: .screenHeader)
			
			Text(text)
				.theme(color: .foregroundSecondary)
				.theme(font: .textTitle)
			
		}
	}
	
}


// MARK: - Preview

#Preview {
	
	ThemePreviewContainer(.view) {
		
		ThemeEmptyDecorationView(text: "Nothing in here")
		
	}
	
}
