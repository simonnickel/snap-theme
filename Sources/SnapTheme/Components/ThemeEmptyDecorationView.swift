//
//  ThemeEmptyDecorationView.swift
//  SnapTheme
//
//  Created by Simon Nickel on 21.09.23.
//

import SwiftUI

public struct ThemeEmptyDecorationView: View {
	
	@Environment(\.theme) private var theme
	
	public init(text: String, icon: Theme.IconKey = .emptySceneDecoration) {
		self.text = text
		self.icon = icon
	}
	
	private let icon: Theme.IconKey
	private let text: String
	
	public var body: some View {
		
		ThemeVStack(spacing: .spacingGroups) {
			
			theme.icon(icon).image
				.theme(text: .sceneHeader)
			
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
