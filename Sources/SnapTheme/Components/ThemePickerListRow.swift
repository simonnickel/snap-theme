//
//  ThemePickerListRow.swift
//  SnapTheme
//
//  Created by Simon Nickel on 14.05.24.
//

import SwiftUI

// TODO macOS: On macOS the SnapCore.PickerTapable variant seems more fitting. Could switch based on platform.

/// Wrapper of Picker to be displayed in a list, allowing style to be applied by using a Menu with Buttons instead of a Picker.
///
/// This should not be necessary at all. See SnapCore.PickerTapable for a non list row version.
///
///	- FB13208225: setting the pickerStyle causes only the picker part to be tappable.
///	Workaround: Setting .pickerStyle() to .menu (instead of .automatic, which is .menu on iOS) causes only the picker part to be tappable.
///
///	- FB12181540: Should be able to apply color and font to Picker.
///	Workaround: Builds a custom
public struct ThemePickerListRow<Label, SelectionValue> : View where Label : View, SelectionValue : Hashable & CustomStringConvertible {
	
	public init(selection: Binding<SelectionValue>, options: [SelectionValue], label: @escaping () -> Label) {
		self.selection = selection
		self.options = options
		self.label = label
	}
	
	let selection: Binding<SelectionValue>
	let options: [SelectionValue]
	let label: () -> Label
	
	public var body: some View {
		
		AnyView(
			Menu(content: {
				ForEach(options, id: \.self) { option in
					Button {
						selection.wrappedValue = option
					} label: {
						ThemeLabel(text: option.description)
					}
				}
			}, label: {
				ThemeHStack(spacing: .spacingElements) {
					label()
						.frame(maxWidth: .infinity, alignment: .leading)
					ThemeHStack(spacing: .spacingLines) {
						ThemeLabel(text: selection.wrappedValue.description, style: .titleOnly)
						ThemeLabel(text: nil, icon: .accessoryPicker, style: .iconOnly)
					}
					.theme(text: .listAccessoryPicker)
				}
			})
		)
		.themeListRow()
		
	}
	
}
