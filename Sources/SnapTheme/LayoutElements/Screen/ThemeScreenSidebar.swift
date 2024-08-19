//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapCore

/// Alternative init to use when selection should not be used. Specify generic SelectionValue.
/// Needed to solve error when selection binding is missing: Generic parameter 'SelectionValue' could not be inferred
public extension ThemeScreenSidebar where SelectionValue == Never {
	init(
		title: String? = nil,
		titleMode: ToolbarTitleDisplayMode = .automatic,
		collapsed: Bool,
		@ViewBuilder content: @escaping () -> Content
	) {
		self.title = title
		self.titleMode = titleMode
		self.background = collapsed ? .screen : .sidebar
		self.selection = nil
		self.collapsed = collapsed
		self.content = content
	}
}

/// A `Screen` represents an independent arrangement of Views that is displayed in a `Scene`, see [Conventions.md](https://github.com/simonnickel/snap-abstract/blob/main/Conventions.md).
/// ``ThemeScreen``, ``ThemeScreenList``, ``ThemeScreenSidebar`` are convenience views to set basic attributes and setup the Content to use the `Theme`.
/// Use:
///  - `Screen(style: .plain)` for the Content as the screen.
///  - `Screen()` to place the Content in a `ScrollView`.
///  - `ThemeScreenList()` to place the Content in a `ListView`.
///  - `ThemeScreenSidebar()` to place the Content in a `ListView` with style `.sidebar`.
public struct ThemeScreenSidebar<SelectionValue, Content>: View where SelectionValue : Hashable, Content : View {
	
	@Environment(\.theme) private var theme
	
	public init(
		title: String? = nil,
		titleMode: ToolbarTitleDisplayMode = .inline,
		selection: Binding<SelectionValue?>? = nil,
		collapsed: Bool,
		@ViewBuilder content: @escaping () -> Content
	) {
		self.title = title
		self.titleMode = titleMode
		self.background = collapsed ? .screen : .sidebar
		self.selection = selection
		self.collapsed = collapsed
		self.content = content
	}
	
	private let title: String?
	private let titleMode: ToolbarTitleDisplayMode
	private let background: Theme.BackgroundKey?
	private let selection: Binding<SelectionValue?>?
	private let collapsed: Bool
	private let content: () -> Content
	
	public var body: some View {
		
		ThemeScreenList(
			title: title,
			titleMode: titleMode,
			background: background,
			listStyle: .sidebar,
			selection: selection,
			content: content
		)

	}
	
}


// MARK: - Preview

#Preview {
	
	@Previewable @State var selected: Int? = 0
	
	return NavigationStack {
		
		ThemeScreenSidebar(title: "Sidebar", selection: $selected, collapsed: false) {
			ForEach(0..<2) { _ in
				Text("Some Content Text with a few Lorem Ipsum like words to fill the row showing the edge behaviour and maybe have a second row.")
			}
		}
		
	}
	
}
