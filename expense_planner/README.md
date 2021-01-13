# expense_planner  
### What i learned in this app?

1. Some new Widgets  
   * Flexible(...)
   * Expanded(...)
   * FitteBox(...)
   * ListTile(...)
   * LayoutBuilder(...)
   * Switch(...)
      * Switch.adaptive(...) - For ios adaptive apps
      * Also we may (should) create our own adaptive widgets. (use another widget for that like 'adaptive_flat_button')  
   * SafeArea(...)
      * Useful for ios apps
   * FlatButton.icon(...)
   * showModalBottomSheet(...)
   * showDatePicker(...)
      * it returns future class
2. Some basics about Future class 
    * Future class's method '.then(...)' which is very useful and essential for this class.

3. Configuring and Using Themes  
    * theme: ThemeData(...) - In ios CupertinoThemeData
    * Some Explanations:
      * theme is an argument for MaterialApp. ThemeData eases our works while using with colors, textTitles etc.
      * With using ThemeData(...) we don't need to strive for theming for all widgets (concisely it is straightforward).
4. Responsive and Adaptive
    * Adaptive Apps => Android - IOS
    * Responsive Apps => MediaQuery.of(context)....
      * AppBar.preferredSize.(height or width)
      * MediaQuery.padding.top (for status bar)
5. Widget & Flutter Internals - Deep Dive
    * Widget Tree - Element Tree - Render Tree
    * build method can be triggered by setState((){}), mediaQuery, Theme etc.
    * Stateless Widget, Stateful Wdiget, Inherited Widget
    * final & const
      * final => runTime
      * const => compileTime
    * spread operator (...)
6. Widget Lifecycle
    1. Stateless Widget 
        * Constructor Function => build()
    2. Stateful Widget
        * Constructor Function => initState() => build() => setState((){}) => didUpdateWidget()O => build() => dispose()
        * Some useful widget that we may override in stateful widget
          * initState()
          * didUpdateWidget()
          * dispose()
7. App LifeCycle
    * inactive
    * paused
    * resumed
    * suspending
8. mixin classes and also 'with' keyword
9. Keys
    * Every flutter widget can have a key. However, we rarely use it most of the time, flutter's implicit key is sufficient.
    * ValueKey(...) we may use id inside of the function as an argument.
10. Adding logics to apps
    * ternary expression
    * if statements
