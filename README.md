<!-- Copy badges from SPI -->
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fsimonnickel%2Fsnap-theme%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/simonnickel/snap-theme)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fsimonnickel%2Fsnap-theme%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/simonnickel/snap-theme) 

> This package is part of the [SNAP](https://github.com/simonnickel/snap) suite.


# SnapTheme

A toolset to abstract Colors, Fonts, Icons and Numbers of a multi-platform SwiftUI app. Define semantic attributes in a `Theme` and apply them to your views for a consistent UI with maintainability in mind.


[![Documentation][documentation badge]][documentation] 

[documentation]: https://swiftpackageindex.com/simonnickel/snap-theme/main/documentation/snaptheme
[documentation badge]: https://img.shields.io/badge/Documentation-DocC-blue


## Motivation

Consistency in look and feel is important. Especially for a growing app project, when you decide to tweak a few attributes or need adjustments to fit platform changes or design trends. Goal of `SnapTheme` is to define visual attributes in a single place, to allow: **A consistent UI with simple adjustments and quick experiments, but strong maintainability.**

Instead of defining design attributes all over the place, you register a semantic key, assign a definition and use it in your SwiftUI views. You can also define multiple Themes to let the user choose it's favorite.

`Theme` comes with:
 - Base attributes (Color, Font, Icon, Number) and composed attributes (Surface, Background, TextSurface).
 - A preset of common semantic definitions for these attributes (e.g. `.textTitle`, `.textSubtitle`) with platform specific default values.
 - ViewModifier to apply them to your views.
 - Wrapper of stock SwiftUI views to set attributes from Theme definitions (e.g. `ThemeVStack(spacing:`)).
 - Convenience views for common layout and style tasks (e.g. `ThemeScreen`, `ThemeElement`).

The Theme is injected in the `Environment` to be available to ViewModifier and Views. 

Fonts and Numbers are scaled by DynamicType by default. This brings some additional benefits: 
 - UI sizes (paddings, spacings, ...) defined by the Theme will scale with DynamicType.
 - By adjusting the Themes scale factor, the whole UI can be zoomed by a simple value change.
  

## How to use

The Theme comes with some presets and is easy to use and customize.

### Define the Theme
Override preset attributes in a custom Theme:
```
let theme = Theme(
	colors: [
		.accentColorBase : .color(.purple)
	], 
	...
)
```

And/or define your own attributes:
```
extension Theme.ColorKey {
	static let exampleColor = Theme.ColorKey("exampleColor", default: .color(.purple))
}
```

### Apply the Theme
```
contentView.theme(apply: theme)
```

### Use the Theme
```
Text("Example").color(.exampleColor)
```


## Definitions

### ColorKey

Represent a semantic meaning of the color (`.foreground`, `.background`, `.accent`, `.destructive`).
They do not describe the color or specific use case (~`.red`~, ~`.buttonLabel`~).


### SurfaceKey

A Surface represents a `ShapeStyle`, either a color, material or gradient.


### FontKey

Represents a semantic meaning of text (`.textTitle`, `.textSubtitle`) and assigns a `FontDefinition`.


### IconKey

Represents a semantic meaning of a visual indicator and assigns an image.


### NumberKey

Represents a specific value. Scaled by dynamic type.


## Key Assignments

### TextSurfaceKey

Assigns a `Surface` to a font.

### BackgroundKey

Defines the background of a semantic layout element (`.screen`, `.content`, `.contentSecondary`) by assigning a `Surface` and a highlight `Surface`.


## SnapAppThemeDemo

A demo of the Theme in action is available at [snap-app-theme-demo](https://github.com/simonnickel/snap-app-theme-demo).
It provides a reference for all preset attributes, demonstrates the default values and provides some configuration sets to change attributes in the app.


## Elements of the Theme 

### ThemeKeys

Key and default value.


### ThemeValues

Values registered for a `ThemeKey`.

Examples: BackgroundValue, ColorValue (TextSurface), FontValue, IconValue, NumberValue 
 
 
### ThemeModifier

Modifier using `ThemeKey`s to apply the configured values on a view. 

Examples: `.theme(background:)`, `.theme(color:)`, `.theme(text:)`, `.theme(padding:)`


### LayoutElements

Generic container views used for layout. Basic building blocks of to build a screen.

Examples: `ThemeScreen`, `ThemeHStack(spacing:)`, `ThemeElement` 


### Components

Views that show content and use `ThemeKey`s to configure style and layout.

Examples: `ThemeLabel(icon:)`, `ThemeCornerView(icon:)`, `ThemeRectangle(cornerRadius:)`


#### Container

Container use `ThemeKey`s to layout content.

Examples: `ThemeCloseContainer`, `ThemeSectionHeaderContainer`


### Styles

Definitions of SwiftUI styles using `ThemeKey`s.

Examples: `ThemeButtonStyle`, `ThemeLabelStyleTag`
