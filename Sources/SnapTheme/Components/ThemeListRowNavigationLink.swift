//
//  ThemeListRowNavigationLink.swift
//  SnapTheme
//
//  Created by Simon Nickel on 26.04.24.
//

import SwiftUI

// TODO: Automatically handle selection state book keeping.

// TODO FB12515251, FB13091055, FB13091169: We need to handle highlight on selection on our own.

public struct ThemeListRowNavigationLink<Label, P>: View where Label : View, P : Decodable, P : Encodable, P : Hashable {
	
	private let value: P
	private let label: () -> Label
	private let isSelected: Bool
	
	public init(value: P, isSelected: Bool, @ViewBuilder label: @escaping () -> Label) {
		self.value = value
		self.label = label
		self.isSelected = isSelected
	}
	
	public var body: some View {
		
		NavigationLink(value: value) {
			
			label()
			
		}
		.themeListRow(isSelected: isSelected)
		
	}
	
}
