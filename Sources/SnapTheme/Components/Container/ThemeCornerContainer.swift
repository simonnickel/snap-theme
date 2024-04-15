//
//  ThemeCornerContainer.swift
//	SnapTheme
//
//  Created by Simon Nickel on 11.09.23.
//

import SwiftUI

public struct ThemeCornerContainer: View {

	public typealias CornerBuilder = () -> any View
	
	public init(@ViewBuilder topLeading: @escaping CornerBuilder, @ViewBuilder topTrailing: @escaping CornerBuilder, @ViewBuilder bottomLeading: @escaping CornerBuilder, @ViewBuilder bottomTrailing: @escaping CornerBuilder) {
		self.topLeading = topLeading
		self.topTrailing = topTrailing
		self.bottomLeading = bottomLeading
		self.bottomTrailing = bottomTrailing
	}
	 
	private let topLeading: CornerBuilder
	private let topTrailing: CornerBuilder
	private let bottomLeading: CornerBuilder
	private let bottomTrailing: CornerBuilder
	
	public var body: some View {
		ThemeVStack(alignment: .leading, spacing: .spacingGroups) {
			
			ThemeHStack(alignment: .top, spacing: .spacingElements) {
				AnyView(topLeading())
				AnyView(topTrailing())
					.frame(maxWidth: .infinity, alignment: .trailing)
			}
			
			HStack(alignment: .bottom) {
				AnyView(bottomLeading())
				AnyView(bottomTrailing())
					.frame(maxWidth: .infinity, alignment: .trailing)
			}
			
		}
	}
	
}


// MARK: - Preview

#Preview {
	
	ThemePreviewContainer(.scene) {
		
		ThemeCornerContainer(topLeading: {
			Text("Top L")
		}, topTrailing: {
			Text("Top T")
		}, bottomLeading: {
			Text("Bot L")
		}, bottomTrailing: {
			Text("Bot T")
		})
		.themeCard(.content)
		
		ThemeCornerContainer(topLeading: {
			EmptyView()
		}, topTrailing: {
			Text("Top T")
		}, bottomLeading: {
			Text("Bot L")
		}, bottomTrailing: {
			Text("Bot T")
		})
		.themeCard(.content)
		
		ThemeCornerContainer(topLeading: {
			Text("Top L")
		}, topTrailing: {
			Text("Top T")
		}, bottomLeading: {
			EmptyView()
		}, bottomTrailing: {
			Text("Bot T")
		})
		.themeCard(.content)
		
		// Empty row does not collapse Stack, spacing is still visible.
		ThemeCornerContainer(topLeading: {
			Text("Top L")
		}, topTrailing: {
			Text("Top T")
		}, bottomLeading: {
			EmptyView()
		}, bottomTrailing: {
			EmptyView()
		})
		.themeCard(.content)
		
	}
	
}
