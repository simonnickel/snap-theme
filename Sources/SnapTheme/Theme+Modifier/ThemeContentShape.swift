//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

public extension View {
	
	func theme(contentShape: ThemeShape.Style, kind: ContentShapeKinds) -> some View {
		return self.modifier(Theme.ThemeContentShape(kind: kind, shape: contentShape))
	}

}


// MARK: - View Modifier

private extension Theme {
	
	struct ThemeContentShape: ViewModifier {
		
		@Environment(\.theme) private var theme
		@ScaledMetric private var scaleFactor: CGFloat = 1
		
		let kind: ContentShapeKinds
		let shape: ThemeShape.Style
		
		public func body(content: Content) -> some View {
			return content
				.contentShape(kind, AnyShape(ThemeShape(shape).shapeViewWith(scaleFactor: scaleFactor, in: theme)))
		}
		
	}
	
}


// MARK: - Preview

#Preview {
	
	ThemePreviewContainer(.view) {
		
		Section {
			
			Text("Press and Hold")
				.padding()
#if !os(macOS)
				.theme(contentShape: .capsule, kind: .contextMenuPreview)
#endif
				.contextMenu(ContextMenu(menuItems: {
					Text("Menu Item 1")
					Text("Menu Item 2")
					Text("Menu Item 3")
				}))
			
		} header: {
			ThemeSectionHeaderContainer {
				ThemeLabel(text: "Theme Content Shape", style: .themeSectionHeader(prominent: true))
			}
		}
		
	}
	
}

