//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapCore

public struct ThemeLabel<LabelContent: View, Style: LabelStyle>: View {
	
	@Environment(\.theme) private var theme
	
	public init(@ViewBuilder _ label: @escaping () -> LabelContent, icon: Theme.IconKey? = nil, style: Style) {
		self.label = label
		self.icon = icon
		self.labelStyle = style
	}
	
	private let label: () -> LabelContent
	private let icon: Theme.IconKey?
	private let labelStyle: Style?
	
	public var body: some View {
		
		Label(
			title: label,
			icon: {
				if let icon {
					theme.icon(icon).image
				}
			}
		)
		.if(unwrap: labelStyle, transform: { view, labelStyle in
			view.labelStyle(labelStyle)
		})
		
	}
	
}

public extension ThemeLabel where LabelContent == Text {
	
	init(text: String?, icon: Theme.IconKey? = nil, style: Style) {
		self.label = { Text(text ?? "") }
		self.icon = icon
		self.labelStyle = style
	}
	
}

// This type-constrained extensions allow to ommit the LabelStyle without explicitly applying DefaultLabelStyle(). This is necessary to apply a LabelStyle from outside of the view.

public extension ThemeLabel where Style == DefaultLabelStyle {
	
	init(icon: Theme.IconKey? = nil, @ViewBuilder _ label: @escaping () -> LabelContent) {
		self.icon = icon
		self.label = label
		self.labelStyle = nil
	}
	
}

public extension ThemeLabel where LabelContent == Text, Style == DefaultLabelStyle {
	
	init(text: String?, icon: Theme.IconKey? = nil) {
		self.label = { Text(text ?? "") }
		self.icon = icon
		self.labelStyle = nil
	}
	
}


// MARK: - Preview

#Preview {
	
	ThemePreviewContainer(.view, alignment: .leading) {
		
		Section {
			ThemeLabel(text: "ThemeLabel", icon: .favorite)
			
			ThemeLabel(text: "ThemeLabelStyleButtonPrimary", icon: .favorite)
				.labelStyle(.themeButtonPrimary)
			
			ThemeLabel(text: "ThemeLabelStyleTag", icon: .favorite)
				.labelStyle(.themeTag())
		} header: {
			ThemeSectionHeaderContainer {
				ThemeLabel(text: "Compare", style: ThemeLabelStyleSectionHeader(prominent: true))
			}
		}
		
		Section {
			ThemeLabel(text: "ThemeLabel")
			ThemeLabel(text: "ThemeLabel", icon: .favorite)
			
			ThemeLabel(text: ".titleAndIcon", icon: .favorite, style: .titleAndIcon)
			ThemeLabel(text: ".titleOnly", icon: .favorite, style: .titleOnly)
			ThemeLabel(text: ".iconOnly", icon: .favorite, style: .iconOnly)
		} header: {
			ThemeSectionHeaderContainer {
				ThemeLabel(text: "Missing Params", style: ThemeLabelStyleSectionHeader(prominent: true))
			}
		}
		
		Section {
			ThemeLabel(text: "ThemeLabel(style:)", icon: .favorite, style: .themeListRow())
			ThemeLabel(text: ".labelStyle", icon: .favorite)
				.labelStyle(.themeListRow())
			ThemeLabel(text: "ThemeLabelStyleListRow()", icon: .favorite)
				.labelStyle(.themeListRow())
		} header: {
			ThemeSectionHeaderContainer {
				ThemeLabel(text: "API Options", style: ThemeLabelStyleSectionHeader(prominent: true))
			}
		}
		
	}
	
}
