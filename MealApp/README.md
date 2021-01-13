# meal_app

![](MealApp.gif)

1. Some New Widgets
    * GridView(...) and GridView.builder(...)
      * gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(...)   (only an example)
    * Linear Gradients
      * It's useful in order to design your Container widget
      * color: it gets list of colors (you may use color.withOpacity(...))
      * begin:
      * end:
    * InkWell(...)
      * It's like gesture detector but it also has a wave affect
      * splashColor:
      * borderRadius: (In my oppinion it should match with container's borderRadius if it has).
    * Card(...)
      * Card is not a new widget but i've learned as new it's argument which is shape:
      * shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(...))
    * ClipRRect(...)
      * I've used it for adding 'borderRadius:'.
      * I wrapped my Image widget with this widget because Image widget is does not support borderRadius.
    * Stack(...)
      * I've used it because it allows us to create nested widgets.
      * I needed to add Text() widget above the image.
    * Text(...)
      * I've learned softWrap and overflow, we may say that these are safe mechanism.
    * Positioned(...)
      * It only works inside a Stack(...) widget.
      * Positioned allows us to position the child widget in an absolute cordinate space.
      * It's arguments: left, right, bottom, top, height and width.
      * Example: when you feed right argument with 10 it means the distance of the widget from rigth is 10 pixels.
    * SizedBox(...)
      * It ensures some spaces between widgets.
    * Some useful MaterialApp(...) arguments
      * onGenerateRoute:
         * If you want to handle your screens dynamically, it's worth to use onGenerateRoute.
         * If there is no screen at that name, OnGenerateRoute works.
      * onUnknownRoute:
         * Flutter reaches onUnknownRouse before throwing error. 
         * We may say that it's last step for flutter.
         * If we don't have any routes and we don't feed onGenerateRoute: argument, finally onUnknownRoute works.
    * Border.all(..)
       * I'm already familiar with Border.circular(...)
       * However, Border.all(..) is a new widget for me.
       * In container when we use border: Border.all()
       * We may access to border's color and we can change it easily, try it while devoloping new apps.
    * ListTile(...) 
      * leading:
      * title:
      * subtitle:
      * trailing:
    * Divider(...)
      * It simply draws horizontal lines.
    * DefaultTabController(...)
      * length:
         * any integer
      * initialIndex: 
         * any integer (it is 0 as default)
      * child: 
         * Scaffold(...)
      * appBar: 
         * title: Text(...)
         * bottom: TabBar()
            * TabBar( tabs: <Widget> [])
               * We should add Tab(...) widgets inside the tabs:
               * make sure your list's length should be equal to length argument above.
      * body: 
         * TabBarView()
   * drawer: Drawer(...)
   * floatingActionButton: FloatingActionButton(...)
   * floatingActionButtonLocation: FloatingActionButtonLocation.(There are some static const properties that you can use).
   * Navigator.of(context).pop(...)
      * It's really useful for passing data to back.
      * You may send any data to back with pop method (List, Map, int, String so on). 
      * you may add then function. When new page is pop works 'then()' method.
      * pop function returns Future object that's why we have a chance to use 'then' method.
   * ListTile(...)
      * You may combine it with ListView(...)
2. Registering a screen as the main screen
   * Just use named argument which is called as 'home:' in materialApp
   * If you decide to use namedRoutes, you may determine it as '/': (ctx) => AnyWidgetScreen()
   * in flutter default initialRoute which is also as known as home is '/'. However, if we want, we may change it with initialRoute: argument 
3. Manuel Route   
   * .push(...)
   * MaterialPageRoute(...)
4. Named Route
   * passing data between widgets is a little bit different.
   * arguments: => we use this as an argument in pushNamed(...) (It can be any object)
   * in order to catch it create a variable in build method With this way (Example):
   * final routeArgs = ModalRoute.of(context).settings.arguments  (you should also add 'as' keyword because it was an Object type)
   * Advice: Use static const property for definining routeName in class, it's more convenient way to get proper error messages.
   
5. Reminder: Don't forget to create your own build methods.  
6. Replacing pages instead of pushing.
   * pushReplacementNamed(...)
   * When we use pushReplacementNamed(...) there won't be a back button because there is no any page in stack.
   * if you don't use this approach, stack will constantly increase and your app will work slowly.
7. If a function returns Future object, you may use then method there.
   * .then(()=> ...) it gets another function.
8. Don't use 'context' in initState because initState runs too early.
   * If you do this, it's really taugh to understand the error.
   * For instance, don't use ModalRoute.of(context), Theme.of(context) etc.
   * The solution in this circumstance is to use changeDependencies() it's another method.
9. DidChangeDependencies(...)
   * It runs couple of time after initState(...) that's the difference between initState(...) and DidChangeDependencies(...)
10. How to data pass back and use the data.
      * In This app we wanted to delete the meal temporarily if someone deletes it in meal_detail_screen.
      * This was relatively tough but this approach is really essential for this course.
      * In this approach we've deleted item but when you open that page again it'll be seen again.
      * Firstly, the page will change when data come. Therefore, we convert the screen to statefulWidget(category_meals_screen).
      * We tried to define the variables in initState(...) with this way when the state have been created all variable will be created.
      * However, in this approah there was a problem which is really important. InitState works really early.
      * If you use initState in this circumstance you'll get an error which is really hard to understand why you get this error.
      * The error because of the variable which contains 'context' if you use something in initState which contains 'context'
      * It causes errors.
      * We decided to use didChangeDependencies(...) instead of initState and it was okay we didn't get any error.
      * However, it didn't work properly because when we pop data it worked again and it initialized datas again.
      * We figured out the problem then, solution was pretty simple we defined a variable whichs boolean type.
      * It decides whether we loadedData or not.
      * If it's false it loads the datas (It also initializes when we create the state, when we come frome previous page)
      * With this way it has been initiliazed when the state created (it located in stack)
      * When we pop new page, previous page is our screen that we want to change and it changed properly.
