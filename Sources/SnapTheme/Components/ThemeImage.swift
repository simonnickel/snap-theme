//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

public struct ThemeImage: View {
	
	@Environment(\.theme) private var theme
	
	public init(icon: Theme.IconKey) {
		self.icon = icon
	}
	
	private let icon: Theme.IconKey
	
	public var body: some View {
		theme.icon(icon).image
	}
	
}
