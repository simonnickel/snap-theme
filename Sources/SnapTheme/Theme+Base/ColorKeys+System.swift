//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

public extension Theme.ColorKey {
	
	static func systemColorSet(for color: Color) -> Theme.ColorSet? {
		return switch color {
			case .accentColor: Theme.ColorSet(base: .accentColorBase, complimentary: .accentColorBaseComplimentary, complementary: .foregroundOnBackground)
			case .red: Theme.ColorSet(base: .systemRedAdjusted, complimentary: .systemRedComplimentary, complementary: .systemRedComplementary)
			case .orange: Theme.ColorSet(base: .systemOrangeAdjusted, complimentary: .systemOrangeComplimentary, complementary: .systemOrangeComplementary)
			case .yellow: Theme.ColorSet(base: .systemYellowAdjusted, complimentary: .systemYellowComplimentary, complementary: .systemYellowComplementary)
			case .green: Theme.ColorSet(base: .systemGreenAdjusted, complimentary: .systemGreenComplimentary, complementary: .systemGreenComplementary)
			case .mint: Theme.ColorSet(base: .systemMintAdjusted, complimentary: .systemMintComplimentary, complementary: .systemMintComplementary)
			case .teal: Theme.ColorSet(base: .systemTealAdjusted, complimentary: .systemTealComplimentary, complementary: .systemTealComplementary)
			case .cyan: Theme.ColorSet(base: .systemCyanAdjusted, complimentary: .systemCyanComplimentary, complementary: .systemCyanComplementary)
			case .blue: Theme.ColorSet(base: .systemBlueAdjusted, complimentary: .systemBlueComplimentary, complementary: .systemBlueComplementary)
			case .indigo: Theme.ColorSet(base: .systemIndigoAdjusted, complimentary: .systemIndigoComplimentary, complementary: .systemIndigoComplementary)
			case .purple: Theme.ColorSet(base: .systemPurpleAdjusted, complimentary: .systemPurpleComplimentary, complementary: .systemPurpleComplementary)
			case .pink: Theme.ColorSet(base: .systemPinkAdjusted, complimentary: .systemPinkComplimentary, complementary: .systemPinkComplementary)
			case .brown: Theme.ColorSet(base: .systemBrownAdjusted, complimentary: .systemBrownComplimentary, complementary: .systemBrownComplementary)
			default: nil
		}
	}
	
	
	
	// MARK: - Red
	
	static let systemRed = Theme.ColorKey("systemRed", default: .color(.red))
	
	static let systemRedAdjusted = Theme.ColorKey("systemRedAdjusted", default: .colorAdjusted(.red, adjustment: .init(saturation: .add(0.1), brightness: .add(-0.15))))
	
	static let systemRedComplimentary = Theme.ColorKey("systemRedComplimentary", default: .keyAdjusted(.systemRedAdjusted, adjustment: .init(hue: .add(0.05))))
	
	static let systemRedComplementary = Theme.ColorKey("systemRedComplimentary", default: .hsba(.init(hue: 60/360, saturation: 1, brightness: 1, alpha: 1)))
	
	
	// MARK: - Orange
	
	static let systemOrange = Theme.ColorKey("systemOrange", default: .color(.orange))
	
	static let systemOrangeAdjusted = Theme.ColorKey("systemOrangeAdjusted", default: .colorAdjusted(.orange, adjustment: .init(saturation: .add(0.1), brightness: .add(-0.05))))
	
	static let systemOrangeComplimentary = Theme.ColorKey("systemOrangeComplimentary", default: .keyAdjusted(.systemOrangeAdjusted, adjustment: .init(hue: .add(-0.02))))
	
	static let systemOrangeComplementary = Theme.ColorKey("systemOrangeComplementary", default: .hsba(.init(hue: 65/360, saturation: 1, brightness: 1, alpha: 1)))

	
	// MARK: - Yellow
	
	static let systemYellow = Theme.ColorKey("systemYellow", default: .color(.yellow))
	
	static let systemYellowAdjusted = Theme.ColorKey("systemYellowAdjusted", default: .colorAdjusted(.yellow, adjustment: .init(saturation: .add(0.2), brightness: .add(-0.08))))
	
	static let systemYellowComplimentary = Theme.ColorKey("systemYellowComplimentary", default: .keyAdjusted(.systemYellowAdjusted, adjustment: .init(hue: .add(-0.04))))
	
	static let systemYellowComplementary = Theme.ColorKey("systemYellowComplementary", default:
			.keyAdjusted(.systemYellowAdjusted, adjustment: .init(hue: .add(-0.2), saturation: .add(0.3), brightness: .replace(0.6))))
	
	
	// MARK: - Green
	
	static let systemGreen = Theme.ColorKey("systemGreen", default: .color(.green))
	
	static let systemGreenAdjusted = Theme.ColorKey("systemGreenAdjusted", default: .colorAdjusted(.green, adjustment: .init(saturation: .add(0.1), brightness: .add(-0.05))))
	
	static let systemGreenComplimentary = Theme.ColorKey("systemGreenComplimentary", default: .keyAdjusted(.systemGreenAdjusted, adjustment: .init(hue: .add(0.1), saturation: .add(0.1), brightness: .add(-0.05))))
	
	static let systemGreenComplementary = Theme.ColorKey("systemGreenComplementary", default: .hsba(.init(hue: 230/360, saturation: 0.8, brightness: 0.8, alpha: 1)))
	
	
	// MARK: - Mint
	
	static let systemMint = Theme.ColorKey("systemMint", default: .color(.mint))
	
	static let systemMintAdjusted = Theme.ColorKey("systemMintAdjusted", default: .colorAdjusted(.mint, adjustment: .init(saturation: .add(-0.1), brightness: .add(-0.06))))
	
	static let systemMintComplimentary = Theme.ColorKey("systemMintComplimentary", default: .keyAdjusted(.systemMintAdjusted, adjustment: .init(hue: .add(0.05))))
	
	static let systemMintComplementary = Theme.ColorKey("systemMintComplementary", default: .hsba(.init(hue: 60/360, saturation: 1, brightness: 0.95, alpha: 1)))
	
	
	// MARK: - Teal
	
	static let systemTeal = Theme.ColorKey("systemTeal", default: .color(.teal))
	
	static let systemTealAdjusted = Theme.ColorKey("systemTealAdjusted", default: .colorAdjusted(.teal, adjustment: .init(saturation: .add(0.2), brightness: .add(-0.05))))
	
	static let systemTealComplimentary = Theme.ColorKey("systemTealComplimentary", default: .keyAdjusted(.systemTealAdjusted, adjustment: .init(hue: .add(0.2), saturation: .add(-0.25), brightness: .add(0.08))))
	
	static let systemTealComplementary = Theme.ColorKey("systemTealComplementary", default: .hsba(.init(hue: 60/360, saturation: 1, brightness: 0.95, alpha: 1)))
	
	
	// MARK: - Cyan
	
	static let systemCyan = Theme.ColorKey("systemCyan", default: .color(.cyan))
	
	static let systemCyanAdjusted = Theme.ColorKey("systemCyanAdjusted", default: .colorAdjusted(.cyan, adjustment: .init(saturation: .add(0.1), brightness: .add(-0.05))))
	
	static let systemCyanComplimentary = Theme.ColorKey("systemCyanComplimentary", default: .keyAdjusted(.systemCyanAdjusted, adjustment: .init(hue: .add(0.05), saturation: .add(-0.05))))
	
	static let systemCyanComplementary = Theme.ColorKey("systemCyanComplementary", default: .hsba(.init(hue: 55/360, saturation: 1, brightness: 1, alpha: 1)))
	
	
	// MARK: - Blue
	
	static let systemBlue = Theme.ColorKey("systemBlue", default: .color(.blue))
	
	static let systemBlueAdjusted = Theme.ColorKey("systemBlueAdjusted", default: .colorAdjusted(.blue, adjustment: .init(saturation: .add(0.1), brightness: .add(-0.05))))
	
	static let systemBlueComplimentary = Theme.ColorKey("systemBlueComplimentary", default: .keyAdjusted(.systemBlueAdjusted, adjustment: .init(hue: .add(0.05))))
	
	static let systemBlueComplementary = Theme.ColorKey("systemBlueComplementary", default:
			.keyAdjusted(.systemBlueAdjusted, adjustment: .init(hue: .replace(95/360), saturation: .add(0.3), brightness: .add(0.5))))
	
	
	// MARK: - Indigo
	
	static let systemIndigo = Theme.ColorKey("systemIndigo", default: .color(.indigo))
	
	static let systemIndigoAdjusted = Theme.ColorKey("systemIndigoAdjusted", default: .colorAdjusted(.indigo, adjustment: .init(saturation: .add(0.1), brightness: .add(-0.05))))
	
	static let systemIndigoComplimentary = Theme.ColorKey("systemIndigoComplimentary", default: .keyAdjusted(.systemIndigoAdjusted, adjustment: .init(hue: .add(0.05))))
	
	static let systemIndigoComplementary = Theme.ColorKey("systemIndigoComplementary", default:
			.keyAdjusted(.systemIndigoAdjusted, adjustment: .init(hue: .replace(105/360), saturation: .add(0.3), brightness: .add(0.5))))
	
	
	// MARK: - Purple
	
	static let systemPurple = Theme.ColorKey("systemPurple", default: .color(.purple))
	
	static let systemPurpleAdjusted = Theme.ColorKey("systemPurpleAdjusted", default: .colorAdjusted(.purple, adjustment: .init(saturation: .add(0.1), brightness: .add(-0.05))))
	
	static let systemPurpleComplimentary = Theme.ColorKey("systemPurpleComplimentary", default: .keyAdjusted(.systemPurpleAdjusted, adjustment: .init(hue: .add(0.05))))
	
	static let systemPurpleComplementary = Theme.ColorKey("systemPurpleComplementary", default:
			.keyAdjusted(.systemPurpleAdjusted, adjustment: .init(hue: .replace(160/360), saturation: .add(0.1), brightness: .add(0.5))))
	
	
	// MARK: - Pink
	
	static let systemPink = Theme.ColorKey("systemPink", default: .color(.pink))
	
	static let systemPinkAdjusted = Theme.ColorKey("systemPinkAdjusted", default: .colorAdjusted(.pink, adjustment: .init(saturation: .add(0.1), brightness: .add(-0.2))))
	
	static let systemPinkComplimentary = Theme.ColorKey("systemPinkComplimentary", default: .keyAdjusted(.systemPinkAdjusted, adjustment: .init(hue: .add(0.05))))
	
	static let systemPinkComplementary = Theme.ColorKey("systemPinkComplementary", default:
			.keyAdjusted(.systemPinkAdjusted, adjustment: .init(hue: .replace(180/360), saturation: .add(-0.3), brightness: .add(0.5))))
	
	
	// MARK: - Brown
	
	static let systemBrown = Theme.ColorKey("systemBrown", default: .color(.brown))
	
	static let systemBrownAdjusted = Theme.ColorKey("systemBrownAdjusted", default: .colorAdjusted(.brown, adjustment: .init(saturation: .add(0.1), brightness: .add(-0.05))))
	
	static let systemBrownComplimentary = Theme.ColorKey("systemBrownComplimentary", default: .keyAdjusted(.systemBrownAdjusted, adjustment: .init(hue: .add(0.05))))
	
	static let systemBrownComplementary = Theme.ColorKey("systemBrownComplementary", default:
			.keyAdjusted(.systemBrownAdjusted, adjustment: .init(hue: .add(-0.4), saturation: .add(-0.3), brightness: .add(0.5))))
	
}
