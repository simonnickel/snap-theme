//
//  ThemeCornerView.swift
//  SnapTheme
//
//  Created by Simon Nickel on 08.09.23.
//

import SwiftUI
import SnapCore


// MARK: - View Model

extension ThemeCornerView {
	
	public struct ViewModel: Hashable {
		
		public init(icon: Theme.IconKey? = nil, title: String? = nil, text: String? = nil, value: String? = nil, isSelected: Bool? = nil) {
			self.icon = icon
			self.title = title
			self.text = text
			self.value = value
			self.isSelected = isSelected
		}
		
		let icon: Theme.IconKey?
		let title: String?
		let text: String?
		let value: String?
		
		let isSelected: Bool?
	}
	
}


// MARK: - ThemeCornerView
	
/// ThemeCornerView.Model.isSelected == nil means the view does not keep space for the indicator.
/// iconOff == nil means there is no icon for deselected, but the space is preserved.
public struct ThemeCornerView: View {
	
	@Environment(\.theme) private var theme
	@ScaledMetric private var scaleFactor: CGFloat = 1
	
	public init(model: ThemeCornerView.ViewModel, alignmentValue: Alignment = .topTrailing, iconOn: Theme.IconKey = .cardIndicatorSelected, iconOff: Theme.IconKey? = .cardIndicatorDisabled, showIconOnDeselect: Bool = true) {
		self.model = model
		self.alignmentValue = alignmentValue
		self.iconOn = iconOn
		self.iconOff = iconOff
	}
	
	private let model: ViewModel
	private let alignmentValue: Alignment
	private let iconOn: Theme.IconKey
	private let iconOff: Theme.IconKey?
	
	public var body: some View {
		
		ThemeCornerContainer(
			topLeading: {
				
				if let icon = model.icon {
					theme.icon(icon).image
						.font(.cardIcon)
				}
				
			}, topTrailing: {
				
				if let value = model.value {
					Text(value)
						.font(.cardValue)
						.frame(maxWidth: .infinity, alignment: alignmentValue)
				}
				
			}, bottomLeading: {
				
				if model.title != nil || model.text != nil {
					VStack {
						if let title = model.title {
							Text(title)
								.font(.cardTitle)
								.frame(maxWidth: .infinity, alignment: .leading)
						}
						if let text = model.text {
							Text(text)
								.font(.cardSubtitle)
								.frame(maxWidth: .infinity, alignment: .leading)
						}
					}
				}
				
			}, bottomTrailing: {
				
				if let isSelected = model.isSelected {
					theme.icon((model.isSelected ?? false) ? .cardIndicatorSelected : .cardIndicatorDisabled).image
						.font(.cardIndicator)
						.if(!isSelected && iconOff == nil) { view in
							view.opacity(0)
						}
				}
				
			}
		)
		
	}
}


// MARK: - Preview

#Preview {
	
	struct FakeModel: Hashable {
		let icon: Theme.IconKey?
		let title: String?
		let text: String?
		let value: String?
		
		func model(isSelected: Bool?) -> ThemeCornerView.ViewModel {
			.init(icon: icon, title: title, text: text, value: value, isSelected: isSelected)
		}
	}
	
	let modelsFav: [FakeModel] = [
		.init(icon: .favorite, title: "Title", text: nil, value: "123"),
		.init(icon: .favorite, title: "Title", text: nil, value: "123"),
		.init(icon: .favorite, title: "Title", text: nil, value: "123"),
		.init(icon: .favorite, title: "Title", text: nil, value: "123"),
	]
	
	let modelsFull: [FakeModel] = [
		.init(icon: .favorite, title: "Title", text: "Text", value: "123"),
		.init(icon: .favorite, title: "Title a bit longer", text: "Text", value: "123"),
		.init(icon: .favorite, title: "Title", text: "Text a bit longer", value: "123"),
		.init(icon: .favorite, title: "Title", text: "Text", value: "123 a bit longer"),
		.init(icon: .favorite, title: "Title a bit longer", text: "Text a bit longer", value: "123 a bit longer"),
	]
	
	let modelsMissingValues: [FakeModel] = [
		.init(icon: .favorite, title: "Title", text: "Text", value: nil),
		.init(icon: .favorite, title: "Title", text: nil, value: "123"),
		.init(icon: .favorite, title: nil, text: "Text", value: "123"),
		.init(icon: nil, title: "Title", text: "Text", value: "123"),
	]
	
	let modelsMissingSets: [FakeModel] = [
		.init(icon: nil, title: "Title", text: "Text", value: nil),
		.init(icon: .favorite, title: nil, text: nil, value: "123"),
	]
	
	let modelsSingleValues: [FakeModel] = [
		.init(icon: .favorite, title: nil, text: nil, value: nil),
		.init(icon: nil, title: "Title", text: nil, value: nil),
		.init(icon: nil, title: nil, text: "Text", value: nil),
		.init(icon: nil, title: nil, text: nil, value: "123"),
	]
	
	let modelsCombos: [FakeModel] = [
		.init(icon: .favorite, title: "Title", text: nil, value: nil),
		.init(icon: nil, title: "Title", text: nil, value: "123"),
		.init(icon: .favorite, title: nil, text: "Text", value: nil),
		.init(icon: nil, title: nil, text: "Text", value: "123"),
	]
	
	let sets: [[FakeModel]] = [
		modelsFav, modelsFull, modelsMissingValues, modelsMissingSets, modelsSingleValues, modelsCombos
	]
	
	return ScrollView([.vertical, .horizontal]) {
		
		Group {
			ForEach(sets, id: \.self) { models in
				
				ThemeSectionHeaderContainer {
					ThemeLabel(text: "Set")
						.labelStyle(.themeSectionHeader(textCase: .uppercase))
				}
				
				HStack {
					ForEach(models, id: \.self) { model in
						ThemeCornerView(model: model.model(isSelected: true))
							.themeCard(.accent)
					}
				}
				
				HStack {
					ForEach(models, id: \.self) { model in
						ThemeCornerView(model: model.model(isSelected: false))
							.themeCard(.accent)
					}
				}
				
				HStack {
					ForEach(models, id: \.self) { model in
						ThemeCornerView(model: model.model(isSelected: nil))
							.themeCard(.accent)
					}
				}
				
			}
		}
		.scenePadding()
		
	}
	
}
