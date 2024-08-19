//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

public struct ThemeNavLinkSidebarRow<Label, P>: View where Label : View, P : Decodable, P : Encodable, P : Hashable {
	
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

//		// TODO FB13475990: NavigationsSplitViews Sidebar shows highlight border when ListRowBackground is used.
////		.theme(listRowBackground: .sidebarSelected, shape: .rectangle(.sidebarBackgroundCornerRadius))
//
	}
	
}
