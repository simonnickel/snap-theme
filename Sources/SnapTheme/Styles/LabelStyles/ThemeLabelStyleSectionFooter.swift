//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapCore

public struct ThemeLabelStyleSectionFooter: LabelStyle {
	
	@Environment(\.theme) private var theme
	
	public init() {}
	
	public func makeBody(configuration: Configuration) -> some View {
		Label {
			configuration.title
		} icon: {
			configuration.icon
				.imageScale(.medium)
		}
		.theme(text: .listFooter)
	}
	
}


// MARK: - LabelStyle Extension

public extension LabelStyle where Self == ThemeLabelStyleSectionFooter {
	
	static var themeSectionFooter: ThemeLabelStyleSectionFooter {
		.init()
	}
	
}


// MARK: - Preview

#Preview {
	
	List {
		
		Section {
			Text("List")
		} header: {
			ThemeLabel(
				text: "Theme Icon Label",
				style: .themeSidebarSectionHeader(textCase: .uppercase)
			)
		} footer: {
			ThemeLabel(
				text: "Theme Icon Label in Section Footer of List.",
				style: .themeSectionFooter
			)
		}
		
		// Just an example on how to combine with other content than just a ThemeLabel.
		Section { Text("List") } footer: {
			Label {
				HStack {
					Circle()
						.frame(width: 30, height: 30)
					VStack(alignment: .leading) {
						Text("Test")
							.theme(text: .cardTitle)
						Text("normal Label")
						Text("normal Label")
					}
				}
			} icon: {
				Rectangle()
					.frame(width: 30, height: 30)
			}
			.labelStyle(.themeSectionFooter)
		}
		
	}
	
}
