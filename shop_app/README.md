# shop_app

1. New Widgets
   * GridTile(...)
     * You may combine it with GridView(...) or GridView.builder(...)
   * GridTileBar(..)
     * You may use it in GridTile(footer: GridTileBar(...))
   * PopUpMenuButton(...)
     * You should use it in actions
     * You may add icon: 
     * Also you have to add itemBuilder:
     * itemBuilder: (ctx) => [PopupMenuItem(), PopUpMenuItem(), ...]
   * PopMenuItem(...)
   * Chip(...)
   * Spacer(...)
   * FittedBox(...)
   * Dismissible(...)
      * You may use it with texts.
2. State Management
    * It's especially important for complicated apps.
    * When we use it?
      * For insantance, your most derived widget needs some data
      * And if only base widget contains this data
      * you need to pass data right? all over some widget that does not need this data.
      * This is really cumbersome and inefficient so we'll use state management.
3. ChangeNotifier
   * We used mixin('with') it with our provider class which includes data.
   * class ProductsProvider with ChangeNotifier{...}
4. notifyListeners(...)
   * When we want to notify listeners about our change.
   * After changing something don't forget to notify listeners.
5. ChangeNotifierProvider(...)
   * You may define all widgets as ChangeNotifierProvider(...)
   * Wrap your MaterialApp with this widget if you want to choose that widget as provider.
   * You have to feed create argument don't forget an example for that:
   * create: (ctx) => ProductsProvider()
   * Widgets that are listening will be rebuild after notifyListener()
   * We assign this duty to ProductsProvider class which lies under the providers folder.
   * If your instance isn't create before use create: argument and simple ChangeNotifierProvider class.
   * if your instance already created before you should use another constructor which is class ChangeNotifierProvider.value(...),
   * This is really important you should be aware of this.
   
6. Inheritance('extends') vs Mixins('with')
   * Inheritance has strong relationship which is known as 'is-relationship'.
   * Hovewer, in Mixins they are just utility classes there is no this kind of relationship in Mixin.
   * For instance in inheritance you may assign derived class object to base class object (object-slicing)
   * These kind of useful things special for inheritance(upcasting, downcasting etc.).
7. Some new things about provider package
   * When we use Provider.of<'\Your provider object'>(context)
   * There is an argument which is called listen and it it true by default
   * Why we need to change it?
     * All widgets that has provider.of<your class>(context) will rebuild if notifyListeners() work  
     * If you don't want to rebuild this widget you should assign false to listen: argument explicitly.
   * if you want to rebuild a spesific area in your widget you should use Consumer approach instead of Provier.of<..>(context)..
 8. Consumer approach instead of Provider.of<...>(context)
    * Consumer always listens the changes. !!!Important
    * In this approach you should determine anywhere as a rebuild section.
    * It can be confusing but that's true, for instance in your widget there are some sections which don't need to 
    * rebuild, you may use Consumer approach instead of Provider.of<...>(context)
    * Consumer<...(dynamic)(Your ChangeNotifier class)>(builder: (ctx, yourData, child) => ...)
    * yourData is the same with "providerData = Provider.of<Your ChangeNotifier class>(context, listen: true);"
    * Therefore you may reach all properties of your changeNotifier class.
    * Briefly, It gets 3 arguments and their types: BuildContext, dynamic(your ChangeNotifier object) and Widget.
    * We're already familiar with ctx so omit it.
    * second argument is really important because with this argument we may reach our class's properties
    * Third argument is important as well, you may create child: argument in your Consumer widget
    * !!! and if you define some widgets in this child these widgets will not be rebuilded after notifyListeners().
    * This child can be a complex widget or custom widget.
    * you can point your child as well (label: child) 
 9. badge.dart file:
    * This file is essential for you because when you look at this file you may see that
    * you can create your own individual widget which may include tons of things.
    * Then, you may also use this widget in your app. 
 
10. ListView(...) doesn't work directly inside of the Column(...) widget.
    * You may use Expanded(...) widget or Container(...) etc. 
11. If you have a conflict in your libraries when you try to add them
    * You may use this approach:  'as'
      * import '../.....' as ci;  
      * You can use ci as prefix while you're using that class. 
    * You may use this approach as well:  'show'
      * in a import if there are 2 or more than classes.
      * And you imported that file just for one class or except of conflicted class.
      * you may use show keyword and you use only one class from that file.
12. You may want to convert your map's values to a list.
    * This is pretty straightforward, for instance, your map's name is items 
    * items.values().toList() now you can use indexes as like list.
13. softwrap: argument can be important in text(...) widgets
    * if you have text widget and for example if you have limited width.
    * You may say softwrap: false, with this way you can restrict your text.
14. Do your logics in your ChangeNotifier classes
    * With this way you can increase your code readability and efficiency.
15. If your states only affects that widget
    * In this situation you should not use Provider package,
    * sufficient to use Stateful widget in these circumstances.
    * It's more efficient.
    * Don't forget to look over Local State and App-wide state again.
