//
//  ThemeListButton.swift
//  SnapTheme
//
//  Created by Simon Nickel on 16.10.23.
//

import SwiftUI
import SnapCore

// TODO FB13498294 - SwiftUI: Button in List not highlighted on tap

public struct ThemeListButton<LStyle: LabelStyle, BStyle: ButtonStyle>: View {
	
	public enum PlacementInGroup {
		case top, middle, bottom
	}
	
	@Environment(\.theme) private var theme
	@ScaledMetric private var scaleFactor: CGFloat = 1
	
	public init(text: String? = nil, icon: Theme.IconKey? = nil, labelStyle: LStyle? = ThemeLabelStyleButtonPrimary(), buttonStyle: BStyle? = ThemeButtonStyle.themePrimary, placement: PlacementInGroup? = nil, action: @escaping () -> Void) {
		self.text = text
		self.icon = icon
		self.labelStyle = labelStyle
		self.buttonStyle = buttonStyle
		self.placement = placement
		self.action = action
	}
	
	private let text: String?
	private let icon: Theme.IconKey?
	private let labelStyle: LStyle?
	private let buttonStyle: BStyle?
	private let placement: PlacementInGroup?
	private let action: () -> Void
	
	public var body: some View {
		
		Section {
			Button(action: action, label: {
				ThemeLabel(text: text, icon: icon)
					.frame(maxWidth: .infinity)
			})
		}
#if !os(macOS) // TODO macOS
		.if(unwrap: placement, transform: { view, placement in
			return switch placement {
				case .top:
					AnyView(view
						.theme(padding: .listSpacingSections, [.top])
						.theme(padding: .spacingElements, [.bottom])
						.listSectionSpacing(0)
					)
				case .middle:
					AnyView(view
						.theme(padding: .spacingElements, [.bottom])
						.listSectionSpacing(0)
					)
				case .bottom:
					AnyView(view
						.theme(padding: .listSpacingSections, [.bottom])
						.listSectionSpacing(0)
					)
			}
		}, else: { view in
			view.listSectionSpacing(.default)
		})
#endif
		.listRowInsets(.zero)
		.listRowBackground(Color.clear)
		.if(unwrap: labelStyle, transform: { view, labelStyle in
			view.labelStyle(labelStyle)
		})
		.if(unwrap: buttonStyle, transform: { view, buttonStyle in
			view.buttonStyle(buttonStyle)
		})

	}
	
}


// MARK: - Preview

#Preview {
	
	List {
		
		Section {
			Text("List Row")
		}
		
		Section {
			Text("List Row")
		}
		
		ThemeListButton(text: "Title") {}
		
		ThemeListButton(text: "Title", placement: .top) {}
		ThemeListButton(text: "Title 2", icon: .favorite, placement: .middle) {}
		ThemeListButton(text: "Reset", buttonStyle: ThemeButtonStyle.themeDestructive, placement: .bottom) {}
		
		ThemeListButton(text: "Title 3", icon: .favorite, placement: .middle) {}
		ThemeListButton(text: "Title", placement: .bottom) {}
		
		ThemeListButton(text: "Title") {}
		
		ThemeListButton(
			text: "Title",
			icon: .favorite,
			labelStyle: ThemeLabelStyleButtonSecondary(),
			buttonStyle: ThemeButtonStyle.themeSecondary
		) {}
		
	}
	
}

