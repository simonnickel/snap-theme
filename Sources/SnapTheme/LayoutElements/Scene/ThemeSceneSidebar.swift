//
//  ThemeSceneSidebar.swift
//  SnapTheme
//
//  Created by Simon Nickel on 04.11.23.
//

import SwiftUI
import SnapCore

/// Alternative init to use when selection should not be used. Specify generic SelectionValue.
/// Needed to solve error when selection binding is missing: Generic parameter 'SelectionValue' could not be inferred
public extension ThemeSceneSidebar where SelectionValue == Never {
	init(
		title: String? = nil,
		titleMode: ToolbarTitleDisplayMode = .automatic,
		collapsed: Bool,
		@ViewBuilder content: @escaping () -> Content
	) {
		self.title = title
		self.titleMode = titleMode
		self.background = collapsed ? .scene : .sidebar
		self.selection = nil
		self.collapsed = collapsed
		self.content = content
	}
}

public struct ThemeSceneSidebar<SelectionValue, Content>: View where SelectionValue : Hashable, Content : View {
	
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
		self.background = collapsed ? .scene : .sidebar
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
		
		ThemeSceneList(
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
	
	@State var selected: Int? = 0
	
	return NavigationStack {
		
		ThemeSceneSidebar(title: "Sidebar", selection: $selected, collapsed: false) {
			ForEach(0..<2) { _ in
				Text("Some Content Text with a few Lorem Ipsum like words to fill the row showing the edge behaviour and maybe have a second row.")
			}
		}
		
	}
	
}
