//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

// TODO FB12515251, FB13091055, FB13091169: We need to handle highlight on selection on our own.

/// The state of selection in a List Navigation context, see ``ThemeListRowNavigationLink``.
@Observable public class ListNavState<NavItem> {
	
	public init(selectedItems: [NavItem] = []) {
		self.selectedItems = selectedItems
	}
	
	public var selectedItems: [NavItem] = []
}

public extension View {
	
	/// A wrapper around `.navigationDestination()` to handle selection state, see ``ThemeListRowNavigationLink``.
	/// - Parameters:
	///   - store: `ListNavState` the selection state is stored in.
	///   - destination: The destination of the navigation link.
	/// - Returns: The modified View.
	func navigationDestinationStored<D, C>(in store: ListNavState<D>, @ViewBuilder destination: @escaping (D) -> C) -> some View where D : Hashable, C : View {
		
		self.navigationDestination(for: D.self) { item in
			destination(item)
				.onAppear {
					store.selectedItems.append(item)
				}
				.onDisappear {
					store.selectedItems.removeAll(where: { $0 == item })
				}
				.environment(store)
		}
		
	}
	
}

/// A wrapper around `NavigationLink()` to handle selection state.
/// Used together with `ListNavState` and `.navigationDestinationStored()`
///
/// **How to use:**
///
///  1. Define NavItem:
///	```
/// enum NavItem: Codable {
///		case itemA, itemB, ...
/// }
///	```
///
///	2. Maintain State in List Screen:
///	```
/// struct MyListScreen: View {
///		private let navSelectionState = ListNavState<NavItem>()
///		...
///	}
///	```
///
///	3. Apply ListRow and NavigationDestination:
///	```
/// struct MyListScreen: View {
///		...
///		var body: any View {
///			List {
///				ThemeListRowNavigationLink(value: NavItem.itemA, state: navSelectionState) {
///					LabelForItemA()
///				}
///			}
///			.navigationDestinationStored(in: navSelectionState) { item in
///				DestinationViewForItemA()
///			}
///		}
///	}
///	```
public struct ThemeListRowNavigationLink<Label, P>: View where Label : View, P : Decodable, P : Encodable, P : Hashable {
	
	private let value: P
	private let label: () -> Label
	private let selectionState: ListNavState<P>
	
	public init(value: P, state: ListNavState<P>, @ViewBuilder label: @escaping () -> Label) {
		self.value = value
		self.label = label
		self.selectionState = state
	}
	
	public var body: some View {
		
		NavigationLink(value: value) {
			
			label()
			
		}
		.themeListRow(isSelected: selectionState.selectedItems.contains(value))
		
	}
	
}
