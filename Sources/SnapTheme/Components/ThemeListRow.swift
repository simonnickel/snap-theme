//
//  ThemeListRow.swift
//  SnapTheme
//
//  Created by Simon Nickel on 23.03.23.
//

import SwiftUI
import SnapCore


// MARK: - View Modifier

public extension View {
	
	/// Apply configured colors for `.backgroundContent` as .listRowBackground.
	///
	/// Should not be used with `NavigationLink`, because it hides the selection highlight.
	/// Needs to track List selection and update the highlight manually, but still does not animate nicely (the deselect animation on pop of the `NavigationStack` does not follow the cancellable swipe transition). See `ExperimentListBackgroundHighlightScene`.
	/// - Parameter isSelected: isSelected
	/// - Returns: Modified view.
	func themeListRow(isSelected: Bool = false, font: Theme.FontKey? = .listLabel, applyThemePadding: Bool = true, applyBackgroundColor: Bool = true) -> some View {
		return self.modifier(Theme.ThemeListRow(isSelected: isSelected, font: font, applyThemePaddding: applyThemePadding, applyBackgroundColor: applyBackgroundColor))
	}

}

private extension Theme {
	
	struct ThemeListRow: ViewModifier {

		let isSelected: Bool
		let font: Theme.FontKey?
		let applyThemePaddding: Bool
		let applyBackgroundColor: Bool
		
		public func body(content: Content) -> some View {
			return content
				.if(unwrap: font, transform: { view, textStyle in
					view
						.theme(font: font)
				})
				.if(applyThemePaddding) { view in
					view
						.theme(padding: .listRowPaddingVertical, .vertical)
						.theme(padding: .listRowPaddingHorizontal, .horizontal)
						.listRowInsets(.zero)
				}
				.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
			#if !os(macOS)
				.if(applyBackgroundColor, transform: { view in
					view
						.theme(listRowBackground: .content, highlighted: isSelected)
				})
			#endif
		}
	}
	
}


// MARK: - Preview

#Preview {
	
	List {
		
		Text(".themeListRow")
			.themeListRow(isSelected: false)
		Text(".themeListRow, selected")
			.themeListRow(isSelected: true)
		
	}
	
}
