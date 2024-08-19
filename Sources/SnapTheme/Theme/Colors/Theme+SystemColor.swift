//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapCore

public extension Theme {
	
	/// Wrapper to conform to Codable.
	/// This also helps preserving dynamic color definitions.
	enum SystemColor: String, Identifiable, Theme.KeyProtocolRequirements {
		public var id: String { rawValue }
		
		case accentColor
		case red, orange, yellow, green, mint, teal, cyan, blue, indigo, purple, pink, brown, white, gray, black, clear, primary, secondary
		case label, secondaryLabel, tertiaryLabel, quaternaryLabel
		case lightText, darkText, link, placeholderText, separator, opaqueSeparator
		case systemBackground, secondarySystemBackground, tertiarySystemBackground
		case systemGroupedBackground, secondarySystemGroupedBackground, tertiarySystemGroupedBackground
		
		public var value: Color {
			return switch self {
				case .accentColor: Color.accentColor
					
				case .red: Color.red
				case .orange: Color.orange
				case .yellow: Color.yellow
				case .green: Color.green
				case .mint: Color.mint
				case .teal: Color.teal
				case .cyan: Color.cyan
				case .blue: Color.blue
				case .indigo: Color.indigo
				case .purple: Color.purple
				case .pink: Color.pink
				case .brown: Color.brown
				case .white: Color.white
				case .gray: Color.gray
				case .black: Color.black
				case .clear: Color.clear
				case .primary: Color.primary
				case .secondary: Color.secondary
					
#if os(macOS)
				case .label: Color(nsColor: .labelColor)
				case .secondaryLabel: Color(nsColor: .secondaryLabelColor)
				case .tertiaryLabel: Color(nsColor: .tertiaryLabelColor)
				case .quaternaryLabel: Color(nsColor: .quaternaryLabelColor)
					
				case .lightText: Color(nsColor: .textColor) // TODO macOS
				case .darkText: Color(nsColor: .textColor) // TODO macOS
				case .link: Color(nsColor: .linkColor)
				case .placeholderText: Color(nsColor: .placeholderTextColor)
				case .separator: Color(nsColor: .separatorColor)
				case .opaqueSeparator: Color(nsColor: .separatorColor) // TODO macOS
					
					// TODO macOS
				case .systemBackground: Color(nsColor: .windowBackgroundColor)
				case .secondarySystemBackground: Color(nsColor: .textBackgroundColor)
				case .tertiarySystemBackground: Color(nsColor: .windowBackgroundColor)
					
					// TODO macOS
				case .systemGroupedBackground: Color(nsColor: .windowBackgroundColor)
				case .secondarySystemGroupedBackground: Color(nsColor: .textBackgroundColor)
				case .tertiarySystemGroupedBackground: Color(nsColor: .windowBackgroundColor)
					
#else
					
				case .label: Color(uiColor: .label)
				case .secondaryLabel: Color(uiColor: .secondaryLabel)
				case .tertiaryLabel: Color(uiColor: .tertiaryLabel)
				case .quaternaryLabel: Color(uiColor: .quaternaryLabel)
					
				case .lightText: Color(uiColor: .lightText)
				case .darkText: Color(uiColor: .darkText)
				case .link: Color(uiColor: .link)
				case .placeholderText: Color(uiColor: .placeholderText)
				case .separator: Color(uiColor: .separator)
				case .opaqueSeparator: Color(uiColor: .opaqueSeparator)

				case .systemBackground: Color(uiColor: .systemBackground)
				case .secondarySystemBackground: Color(uiColor: .secondarySystemBackground)
				case .tertiarySystemBackground: Color(uiColor: .tertiarySystemBackground)
					
				case .systemGroupedBackground: Color(uiColor: .systemGroupedBackground)
				case .secondarySystemGroupedBackground: Color(uiColor: .secondarySystemGroupedBackground)
				case .tertiarySystemGroupedBackground: Color(uiColor: .tertiarySystemGroupedBackground)
					
#endif
					
			}
		}
		
		public var adjustment: Color.Adjustment? {
			return switch self {
					
				case .red: Color.Adjustment(saturation: .add(0.1), brightness: .add(-0.15))
				case .orange: Color.Adjustment(saturation: .add(0.1), brightness: .add(-0.05))
				case .yellow: Color.Adjustment(saturation: .add(0.2), brightness: .add(-0.08))
				case .green: Color.Adjustment(saturation: .add(0.1), brightness: .add(-0.05))
				case .mint: Color.Adjustment(saturation: .add(-0.1), brightness: .add(-0.06))
				case .teal: Color.Adjustment(saturation: .add(0.2), brightness: .add(-0.05))
				case .cyan: Color.Adjustment(saturation: .add(0.1), brightness: .add(-0.05))
				case .blue: Color.Adjustment(saturation: .add(0.1), brightness: .add(-0.05))
				case .indigo: Color.Adjustment(saturation: .add(0.1), brightness: .add(-0.05))
				case .purple: Color.Adjustment(saturation: .add(0.1), brightness: .add(-0.05))
				case .pink: Color.Adjustment(saturation: .add(0.1), brightness: .add(-0.2))
				case .brown: Color.Adjustment(saturation: .add(0.1), brightness: .add(-0.05))
					
				default: nil
			}
		}
		
		public var adjustmentComplimentary: Color.Adjustment? {
			return switch self {
					
					// hue: .add(0.05)
				
				case .red: Color.Adjustment(hue: .add(0.05))
				case .orange: Color.Adjustment(hue: .add(-0.02))
				case .yellow: Color.Adjustment(hue: .add(-0.04))
				case .green: Color.Adjustment(hue: .add(0.1), saturation: .add(0.1), brightness: .add(-0.05))
				case .mint: Color.Adjustment(hue: .add(0.05))
				case .teal: Color.Adjustment(hue: .add(0.2), saturation: .add(-0.25), brightness: .add(0.08))
				case .cyan: Color.Adjustment(hue: .add(0.05), saturation: .add(-0.05))
				case .blue: Color.Adjustment(hue: .add(0.05))
				case .indigo: Color.Adjustment(hue: .add(0.05))
				case .purple: Color.Adjustment(hue: .add(0.05))
				case .pink: Color.Adjustment(hue: .add(0.05))
				case .brown: Color.Adjustment(hue: .add(0.05))
					
				default: nil
			}
		}
		
		public var adjustmentComplementary: Color.Adjustment? {
			return switch self {
					
					// hue: .add(-0.4), saturation: .add(0.3), brightness: .add(0.5)
					
				case .red: Color.Adjustment(hue: .replace(60/360), saturation: .replace(1), brightness: .replace(1))
				case .orange: Color.Adjustment(hue: .replace(65/360), saturation: .replace(1), brightness: .replace(1))
				case .yellow: Color.Adjustment(hue: .add(-0.2), saturation: .add(0.3), brightness: .replace(0.6))
				case .green: Color.Adjustment(hue: .replace(230/360), saturation: .replace(0.8), brightness: .replace(0.8))
				case .mint: Color.Adjustment(hue: .replace(60/360), saturation: .replace(1), brightness: .replace(0.95))
				case .teal: Color.Adjustment(hue: .replace(60/360), saturation: .replace(1), brightness: .replace(0.95))
				case .cyan: Color.Adjustment(hue: .replace(55/360), saturation: .replace(1), brightness: .replace(1))
				case .blue: Color.Adjustment(hue: .replace(95/360), saturation: .add(0.3), brightness: .add(0.5))
				case .indigo: Color.Adjustment(hue: .replace(105/360), saturation: .add(0.3), brightness: .add(0.5))
				case .purple: Color.Adjustment(hue: .replace(160/360), saturation: .add(0.1), brightness: .add(0.5))
				case .pink: Color.Adjustment(hue: .replace(180/360), saturation: .add(-0.3), brightness: .add(0.5))
				case .brown: Color.Adjustment(hue: .add(-0.4), saturation: .add(-0.3), brightness: .add(0.5))
					
				default: nil
			}
		}
		
	}
	
}
