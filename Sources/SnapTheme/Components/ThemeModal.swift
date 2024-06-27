//
//  ThemeModal.swift
//  SnapTheme
//
//  Created by Simon Nickel on 06.07.23.
//

import SwiftUI
import SnapCore

// FB13119509: SwiftUIInspectorDismissAction
// - The environments DismissAction does not dismiss the .inspector
// - The .presentationBackground() view modifier does not work for .inspector

/*
 // TODO feedback: FB???
 Known issues:
 - PresentationDetents are not supported on iPad.
 - Changing sizeClass while sheet is presented causes background to stay dimmed.
 - Screens below sheet do not scroll far enough to see all content.
 - .inspector in compact size class looks like but does not behave like .sheet. E.g. Theme Configuration does not get proper coloring.
*/


// TODO idea: Different sheet Styles / Sets of configuration


// MARK: - View Modifier

public extension View {
	
	/// Configures a view for modal presentation.
	/// - Parameters:
	///   - detents: `Detent`s to allow a sheet to be presented in. Last entry is used as default.
	///   - selectedDetent: A `Binding` to the current selected `Detent`.
	///   - contentInteraction: `PresentationContentInteraction` to use for the modal.
	///   - backgroundInteraction: `PresentationBackgroundInteraction` to use for the modal.
	///   - dragIndicator: `Visibility` of the drag indicator.
	///   - cornerRadius: `Theme.NumberKey` to use as corner radius.
	///   - background: `any ShapeStyle` to apply as background.
	/// - Returns: Modified View.
	func themeModal(
		detents: [PresentationDetent] = [.medium, .large],
		selectedDetent: Binding<PresentationDetent>? = nil,
		contentInteraction: PresentationContentInteraction = .automatic,
		backgroundInteraction: PresentationBackgroundInteraction = .automatic,
		dragIndicator: Visibility = .automatic,
		cornerRadius: Theme.NumberKey? = .cornerRadiusSheet,
		background: (any ShapeStyle)? = nil
	) -> some View {
		return self
			.modifier(Theme.ThemeModal(
				detents: detents,
				selectedDetent: selectedDetent,
				cornerRadius: cornerRadius
			))
			.presentationContentInteraction(contentInteraction)
			.presentationBackgroundInteraction(backgroundInteraction)
			.presentationDragIndicator(dragIndicator)
			.if(unwrap: background, transform: { view, background in
				view.presentationBackground(AnyShapeStyle(background))
			})
	}
	
}

private extension Theme {
	
	struct ThemeModal: ViewModifier {
		
		@Environment(\.theme) private var theme
		@ScaledMetric private var scaleFactor: CGFloat = 1
		
		internal init(
			detents: [PresentationDetent],
			selectedDetent: Binding<PresentationDetent>? = nil,
			cornerRadius: Theme.NumberKey?
		) {
			self.detents = Set(detents)
			self.currentPresentationDetentExternal = selectedDetent
			self.cornerRadius = cornerRadius

			_currentPresentationDetent = State(initialValue: detents.last ?? .large)
		}
		
		private let detents: Set<PresentationDetent>
		private let currentPresentationDetentExternal: Binding<PresentationDetent>?
		@State private var currentPresentationDetent: PresentationDetent
		
		private let cornerRadius: Theme.NumberKey?
		
		public func body(content: Content) -> some View {
			let cornerRadiusValue: Theme.NumberValueType? = if let cornerRadius {
				theme.number(cornerRadius, scaled: scaleFactor)
			} else { nil }
			
			return content
				.presentationDetents(detents, selection: currentPresentationDetentExternal ?? $currentPresentationDetent)
				.presentationCornerRadius(cornerRadiusValue)
				.presentationSizing(.page) // TODO: Play around with new options
				// .presentationCompactAdaptation(.fullScreenCover) for .popOver only
		}
	}
	
}


// MARK: - Preview

#Preview {
	
	struct Container: View {
		
		@State var selectedStyle: ModalPresentationStyle = .sheet
		@State var isPresented: Bool = false
		
		var body: some View {
			VStack {
				
				Picker(selection: $selectedStyle) {
					ForEach(ModalPresentationStyle.allCases) { style in
						Text(style.rawValue).tag(style)
					}
				} label: {
					Text("Label")
				}
				.pickerStyle(.segmented)

				Toggle(isOn: $isPresented) {
					Text("Show Modal")
				}
				
			}
			.scenePadding()
			.modalPresentation(style: selectedStyle, isPresented: $isPresented, content: {
				ThemeCloseContainer(padding: .paddingModal) {
					List(0..<100) { item in
						Text("Item \(item)")
					}
				} onClose: {
					isPresented = false
				}
				.themeModal()
			})
		}
	}
	
	return Container()
		.environment(\.theme, Theme(
			numbers: [
				:
			],
			fonts: [
				:
			]
		))
	
}
