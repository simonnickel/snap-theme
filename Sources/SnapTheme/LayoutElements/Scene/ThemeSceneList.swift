//
//  ThemeSceneList.swift
//	SnapTheme
//
//  Created by Simon Nickel on 04.11.23.
//

import SwiftUI
import SnapCore

/// Alternative init to use when selection should not be used. Specify generic SelectionValue.
/// Needed to solve error when selection binding is missing: Generic parameter 'SelectionValue' could not be inferred
public extension ThemeSceneList where SelectionValue == Never {
	init(
		title: String? = nil,
		titleMode: ToolbarTitleDisplayMode = .automatic,
		background: Theme.BackgroundKey? = .scene,
		listStyle: Theme.ThemeListStyle = .automatic,
		@ViewBuilder content: @escaping () -> Content
	) {
		self.baseData = .init(title: title, titleMode: titleMode, background: background)
		self.listStyle = listStyle
		self.selection = nil
		self.content = content
	}
}

public struct ThemeSceneList<SelectionValue, Content>: View where SelectionValue : Hashable, Content : View {
	
	@Environment(\.theme) private var theme
	
	public init(
		title: String? = nil,
		titleMode: ToolbarTitleDisplayMode = .automatic,
		background: Theme.BackgroundKey? = .scene,
		listStyle: Theme.ThemeListStyle = .automatic,
		selection: Binding<SelectionValue?>? = nil,
		@ViewBuilder content: @escaping () -> Content
	) {
		self.baseData = .init(title: title, titleMode: titleMode, background: background)
		self.listStyle = listStyle
		self.selection = selection
		self.content = content
	}
	
	private let baseData: Theme.ThemeSceneBaseModifier.Model
	private let listStyle: Theme.ThemeListStyle
	private let selection: Binding<SelectionValue?>?
	private let content: () -> Content
	
	public var body: some View {
		
		AnyView(
			List(selection: selection, content: content)
				.themeListStyle(listStyle)
		)
		.modifier(Theme.ThemeSceneBaseModifier(data: baseData))
		.if(unwrap: baseData.background, transform: { view, background -> AnyView in
			let value = theme.backgroundValue(for: background)
			return AnyView(
				view.if(value != .system) { view in
					view.scrollContentBackground(.hidden)
				}
			)
		})

	}
	
}


// MARK: - Preview

#Preview {
	
	@State var selected: Int? = 0
	
	return NavigationStack {
		
		ThemeSceneList(title: "List", selection:  $selected) {
			ForEach(0..<2) { _ in
				Text("Some Content Text with a few Lorem Ipsum like words to fill the row showing the edge behaviour and maybe have a second row.")
			}
		}
		
	}
	
}


// MARK: - Preview List Styles

#Preview {
	
	return NavigationStack {
		
		Factory.createList(style: .automatic)
		
	}
	.environment(\.theme, Theme(
		icons: [:],
		values: [:],
		colors: [
			//							:
			.background : .color(.teal),
			.backgroundContent : .color(.mint)
		],
		fonts: [:]
	))
	
	struct Factory {
		static func createList(style: Theme.ThemeListStyle) -> some View {
			
			ThemeScene(
				title: style.rawValue
			) {
				
				Section {
					ForEach(Theme.ThemeListStyle.allCases) { style in
						NavigationLink(style.rawValue) {
							AnyView(
								createList(style: style)
							)
						}.themeListRow()
					}
				} header: {
					ThemeLabel(text: "List Styles")
						.labelStyle(.themeSectionHeader(textCase: .uppercase))
				}
				
				Section {
					Text("Text")
						.themeListRow()
					
					NavigationLink(value: "String") {
						VStack {
							Rectangle()
							Circle()
						}
					}.themeListRow()
				} header: {
					ThemeLabel(text: "Text")
						.labelStyle(.themeSectionHeader(textCase: .uppercase))
				}
				
			}
			
		}
	}
	
}


