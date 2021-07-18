#### Class 1
- Always use `View` struct to encapsulate UI components
- Properties set at parent level, e.g. `.padding` or `.foregroundColor` gets inherited to low level components.

#### Class 2
- All local variables are immutable 
- Annotations like `@State` still doesn't make variables mutable, it in fact creates a pointer on the variable to track the actual value stored some where else, and ask the UI to recompute variables everytime when the actual value change 
- Free images/icons could be found at [developers apple site - SF Symbols](https://developer.apple.com/sf-symbols/)
- `ForEach` generates a list of View in a combiner, i.e. `VStack` or `ZStack` etc.
- UI portion of SWIFT is pure functional programming. Why? Because everything in the UI are essentially immutable, and gets re-computed when stuff like `@State` change
