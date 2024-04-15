//
//  ThemeNavLinkSidebarRow.swift
//  SnapTheme
//
//  Created by Simon Nickel on 25.09.23.
//

import SwiftUI

public struct ThemeNavLinkSidebarRow<Label, P>: View where Label : View, P : Decodable, P : Encodable, P : Hashable {
	
	private let value: P
	private let label: () -> Label
	private let isSelected: Bool
	private let isCollapsed: Bool
	
	public init(value: P, isSelected: Bool, isCollapsed: Bool, @ViewBuilder label: @escaping () -> Label) {
		self.value = value
		self.label = label
		self.isSelected = isSelected
		self.isCollapsed = isCollapsed
	}
	
	public var body: some View {
		
		NavigationLink(value: value) {
			
			label()
			
		}
		.if(isCollapsed, transform: { view in
			view.theme(listRowBackground: isSelected ? .sidebarSelected : .content)
		})
		
		// TODO FB13475990: NavigationsSplitViews Sidebar shows highlight border when ListRowBackground is used.
//		, else: { view in
//			view.theme(listRowBackground: isSelected ? .sidebarSelected : .system, shape: .rectangle(.sidebarBackgroundCornerRadius))
//		})
		
	}
	
}
