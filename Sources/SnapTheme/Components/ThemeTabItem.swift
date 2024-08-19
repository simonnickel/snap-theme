//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

// FB13375399: TabBar tabItem should support foregroundStyle as ShapeStyle, not just Color.

public struct ThemeTabItem: View {
	
	@Environment(\.theme) private var theme
	
	public init(text: String? = nil, icon: Theme.IconKey? = nil) {
		self.text = text
		self.icon = icon
	}
	
	private let text: String?
	private let icon: Theme.IconKey?
	
	public var body: some View {
		
		Group {
			if let icon {
				theme.icon(icon).image
			}

			if let text {
				Text(text)
			}
		}
		
	}
}


// MARK: - Preview

#Preview {
	
	TabView() {
		
		Group { Text("A") }
		.tabItem {
			ThemeTabItem(text: "Tab Item", icon: .favorite)
				.theme(font: .screenHeader)
		}.tag("a")
		
		Group { Text("B") }
		.tabItem {
			ThemeTabItem(text: "Tab Item")
		}.tag("b")
		
		Group { Text("C") }
		.tabItem {
			ThemeTabItem(icon: .favorite)
		}.tag("c")
		
		Group { Text("D") }
		.tabItem {
			ThemeTabItem()
		}.tag("d")
		
	}
	
}

