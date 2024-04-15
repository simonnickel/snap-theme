//
//  ThemeCard+Style.swift
//  SnapTheme
//
//  Created by Simon Nickel on 04.11.23.
//

import Foundation

public extension Theme.Card {
	
	enum Style: Sendable {
		
		case content, contentSecondary, accent
		
		case custom(color: Theme.ColorKey, background: Theme.BackgroundKey)
		
		var foreground: Theme.ColorKey {
			switch self {
				case .content: .foreground
				case .contentSecondary: .foreground
				case .accent: .foregroundOnBackground
				case .custom(color: let color, background: _): color
			}
		}
		
		func backgroundKey(in theme: Theme) -> Theme.BackgroundKey {
			switch self {
				case .content: .content
				case .contentSecondary: .contentSecondary
				case .accent: .accent
				case .custom(color: _, background: let background): background
			}
		}
		
	}
	
}
