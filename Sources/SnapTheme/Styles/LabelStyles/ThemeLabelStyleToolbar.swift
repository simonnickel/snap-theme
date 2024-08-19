//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapCore

public struct ThemeLabelStyleToolbar: LabelStyle {
	
	public enum Placement {
		case navigation, sidebarBottom
	}
	
	public init(placement: Placement, showTitle: Bool = true) {
		self.placement = placement
		self.showTitle = showTitle
	}
	
	private let placement: Placement
	private let showTitle: Bool
	
	public func makeBody(configuration: Configuration) -> some View {
		
		Label {
			configuration.title
				.theme(font: placement == .navigation ? .toolbarNavigationLabel : .toolbarLabel)
		} icon: {
			configuration.icon
				.theme(font: placement == .navigation ? .toolbarNavigationIcon : .toolbarIcon)
				.imageScale(.large)
		}
		.labelStyle(showTitle ? AnyLabelStyle(.titleAndIcon) : AnyLabelStyle(.iconOnly))
		
	}
	
}
