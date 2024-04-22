<!-- Copy badges from SPI -->
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fsimonnickel%2Fsnap-theme%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/simonnickel/snap-theme)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fsimonnickel%2Fsnap-theme%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/simonnickel/snap-theme) 

> This package is part of the [SNAP](https://github.com/simonnickel/snap-abstract) suite.


# SnapTheme

A toolset to abstract Colors, Fonts, Icons and Numbers into semantic definitions for a SwiftUI app. The package contains a Theme definition to hold semantic values and a set of ViewModifier to apply them to SwiftUI views.


[![Documentation][documentation badge]][documentation] 

[documentation]: https://swiftpackageindex.com/simonnickel/snap-theme/main/documentation/snaptheme
[documentation badge]: https://img.shields.io/badge/Documentation-DocC-blue


## How to use

Create a Theme:

```
	let theme = Theme(
		colors: [
			.accentColorBase : .color(.purple)
		], 
		...
	)
```

Apply the Theme to your view:
```
contentView
	.theme(apply: theme)
```


## Definitions

### ColorKey

Represent a semantic meaning of the color (`.foreground`, `.background`, `.accent`, `.destructive`).
They do not describe the color or specific use case (~`.red`~, ~`.buttonLabel`~).


### SurfaceKey

A Surface represents a specific visual style and a highlight. Can be a gradient, material or color.


### FontKey

Represents a semantic meaning of text (`.textTitle`, `.textSubtitle`) and assigns a `FontDefinition`.


### IconKey

Represents a semantic meaning of a visual indicator and assigns an image.


### ValueKey

Represents a specific value.


## Key Assignments

### TextSurfaceKey

Assigns a `Surface` to a font.

### BackgroundKey

Defines the background of a semantic layout element (`.scene`, `.content`, `.contentSecondary`) by assigning a `Surface`.


## Demo
The Demo project shows some examples of the theme elements.


## Elements of the Theme 

### ThemeKeys

Key and default value.


### ThemeValues

Values registered for a `ThemeKey`.

Examples: BackgroundValue, ColorValue (TextSurface), FontValue, IconValue, Value 
 
 
### ThemeModifier

Modifier using `ThemeKey`s to apply the configured values on a view. 

Examples: `.theme(background:)`, `.theme(color:)`, `.theme(text:)`, `.theme(padding:)`


### LayoutElements

Generic container views used for layout. Basic building blocks of to build a scene.

Examples: `ThemeScene`, `ThemeHStack(spacing:)`, `ThemeElement` 


### Components

Views that show content and use `ThemeKey`s to configure style and layout.

Examples: `ThemeLabel(icon:)`, `ThemeCornerView(icon:)`, `ThemeRectangle(cornerRadius:)`


#### Container

Container use `ThemeKey`s to layout content.

Examples: `ThemeCloseContainer`, `ThemeSectionHeaderContainer`


### Styles

Definitions of SwiftUI styles using `ThemeKey`s.

Examples: `ThemeButtonStyle`, `ThemeLabelStyleTag`
