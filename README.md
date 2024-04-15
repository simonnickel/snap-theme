# SnapTheme

A toolset to abstract Colors, Fonts and Values into semantic definitions for a SwiftUI app.

> This package is part of the [SNAP](https://github.com/simonnickel/snap-abstract) suite.


## Definitions

### ColorKey

Represent a semantic meaning of the color (`.foreground`, `.background`, `.accent`, `.destructive`).
They do not describe the color or specific use case (~`.red`~, ~`.buttonLabel`~).


### SurfaceKey

A Surface represents a specific visual style. Can be a gradient, material or color.


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
