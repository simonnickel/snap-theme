//
//  Theme+FontDefinition.swift
//  SnapTheme
//
//  Created by Simon Nickel on 13.10.23.
//

import SwiftUI

// TODO UIKit: Convert to UIFont
// Map weight, textStyles, ...
//	func uiFont(_ key: FontKeyBase) -> UIFont? {
//		let fontDefinition = fonts[key] ?? Theme.themeDefault.fonts[key]
//
//		return UIFont.systemFont(ofSize: fontDefinition?.size, weight: fontDefinition?.weight)
//	}


// MARK: - FontDefinition

public extension Theme {
	
	struct FontDefinition: Theme.KeyProtocolRequirements {
		
		public let family: FontFamily?
		public let size: CGFloat
		public let design: FontDesign?
		public let weight: FontWeight
		
		/// Used as reference for dynamic type scaling.
		public let textStyle: TextStyle
		
		public init(family: FontFamily? = nil, size: CGFloat, design: FontDesign?, weight: FontWeight, textStyle: TextStyle = .body) {
			self.family = family
			self.size = size
			self.design = design
			self.weight = weight
			self.textStyle = .body
		}
		
		public init(size: CGFloat, weight: FontWeight, textStyle: TextStyle = .body) {
			self.init(family: nil, size: size, design: nil, weight: weight, textStyle: textStyle)
		}
		
	}
}

public extension Theme.FontDefinition {
	

	// MARK: - FontFamily

	enum FontFamily: Theme.KeyProtocolRequirements {
		case system
		case custom(String)
	}
	
	
	// MARK: - FontDesign
	
	/// A Wrapper around Font.Design to conform to Codable.
	enum FontDesign: Theme.KeyProtocolRequirements {
		case `default`, serif, rounded, monospaced
		
		var value: Font.Design {
			return switch self {
				case .`default`: .default
				case .serif: .serif
				case .rounded: .rounded
				case .monospaced: .monospaced
			}
		}
		
#if !os(macOS)
		var valueUIFontDescriptor: UIFontDescriptor.SystemDesign {
			return switch self {
				case .`default`: .default
				case .serif: .serif
				case .rounded: .rounded
				case .monospaced: .monospaced
			}
		}
#endif
	}
	
	
	// MARK: - FontWeight
	
	/// A Wrapper around Font.Weight to conform to Codable.
	enum FontWeight: String, Theme.KeyProtocolRequirements {
		case ultraLight, thin, light, regular, medium, semibold, bold, heavy, black
		
		var value: Font.Weight {
			return switch self {
				case .ultraLight: .ultraLight
				case .thin: .thin
				case .light: .light
				case .regular: .regular
				case .medium: .medium
				case .semibold: .semibold
				case .bold: .bold
				case .heavy: .heavy
				case .black: .black
			}
		}
	}


	// MARK: - TextStyle
	
	/// A Wrapper around TextStyle to conform to Codable.
	enum TextStyle: Theme.KeyProtocolRequirements {
		case largeTitle, title1, title2, title3, headline, subheadline, body, callout, footnote, caption1, caption2
		// case extraLargeTitle, extraLargeTitle2 // Missing in AppKit anyway.
		
		// TOOD: It should be possible to conform to Codable by using the raw value of UIFont.TextStyle. But this would only work with UIKit.
		public var rawValue: String {
#if !os(macOS)
			valueUIKit.rawValue
#else
			valueAppKit.rawValue
#endif
		}
		
#if !os(macOS)
		var valueUIKit: UIFont.TextStyle {
			return switch self {
				case .largeTitle: .largeTitle
				case .title1: .title1
				case .title2: .title2
				case .title3: .title3
				case .headline: .headline
				case .subheadline: .subheadline
				case .body: .body
				case .callout: .callout
				case .footnote: .footnote
				case .caption1: .caption1
				case .caption2: .caption2
			}
		}
#else
		var valueAppKit: NSFont.TextStyle {
			return switch self {
				case .largeTitle: .largeTitle
				case .title1: .title1
				case .title2: .title2
				case .title3: .title3
				case .headline: .headline
				case .subheadline: .subheadline
				case .body: .body
				case .callout: .callout
				case .footnote: .footnote
				case .caption1: .caption1
				case .caption2: .caption2
			}
		}
#endif
		
		var value: Font.TextStyle {
			return switch self {
				case .largeTitle: .largeTitle
				case .title1: .title
				case .title2: .title2
				case .title3: .title3
				case .headline: .headline
				case .subheadline: .subheadline
				case .body: .body
				case .callout: .callout
				case .footnote: .footnote
				case .caption1: .caption
				case .caption2: .caption2
			}
		}
	}
	
}
