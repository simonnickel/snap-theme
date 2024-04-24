//
//  ThemeCloseContainer.swift
//  SnapTheme
//
//  Created by Simon Nickel on 05.09.23.
//

import SwiftUI

/// A container view to present some `Content` with a close button. E.g. to put it in a modal presentation like .sheet or .inspector.
public struct ThemeCloseContainer<Content: View>: View {
	
	@Environment(\.theme) private var theme
	@Environment(\.dismiss) private var dismiss
	
	public init(alignment: Alignment = .topTrailing, padding: Theme.NumberKey? = .paddingModalCloseButton, @ViewBuilder content: @escaping () -> Content, onClose: ThemeCloseContainer<Content>.CloseHandler? = nil) {
		self.alignment = alignment
		self.padding = padding
		self.content = content
		self.onClose = onClose
	}
	
	@ViewBuilder private let content: () -> Content

	private let alignment: Alignment
	private let padding: Theme.NumberKey?
	public typealias CloseHandler = () -> Void
	private let onClose: CloseHandler?
	
	public var body: some View {
		
		ZStack(alignment: alignment) {
			content()
				.frame(maxWidth: .infinity, maxHeight: .infinity)
			
			Button {
				if let onClose {
					onClose()
				} else {
					dismiss()
				}
			} label: {
				theme.icon(.close).image
			}
			.theme(font: .toolbarClose)
			.theme(surface: .uiIndicator)
			.if(unwrap: padding) { view, padding in
				view.theme(padding: padding)
			}
		}
		
	}
	
}


// MARK: - Preview

#Preview {
	
	ThemePreviewContainer(.screen) {
		
		ThemeCloseContainer {
			Text("Top Trailing Default")
		}
		.theme(backgroundColor: .backgroundContent)
		
		ThemeCloseContainer(alignment: .topLeading) {
			Text("Top Leading")
		}
		.theme(backgroundColor: .backgroundContent)
		
		ThemeCloseContainer(padding: .spacingElements) {
			Text(".spacingElements")
		}
		.theme(backgroundColor: .backgroundContent)
		
		ThemeCloseContainer(content: {
			Text(".themeCard")
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				.themeCard(.accent)
		})
		
	}
	
}
