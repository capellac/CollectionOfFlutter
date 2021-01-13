# WORKING WITH USER INPUT & FORMS

1. Showing snackBars  
    ![][snackBar]
    * We need to add connection to nearest Scaffold.
    * Therefore, we use Scaffold.of(context)... for that.
    * Scaffold.of(context).showSnackBar(SnackBar(content: Text('Added item to cart!')));
    * You may also add duration, its default duration is 4 seconds.
    * You may also want to hide current snackbar when there is a new snackbar.
    * This is pretty easy you can write Scaffold.of(context).hideCurrentSnackBar();
    
2. Showing Alert Dialogs  
    ![][showDialog]
    * You can add this dialog to Dismissible(...) widget.
    * confirmDismiss is an awesome place for that (don't forget it takes a function).
    * First widget that we'll use is showDialog(...) it takes some arguments but we'll use just 2 of them.
    * context: context (it needs to know which widget it's adapted)
    * builder: AlertDialog(...)
3. Form(...) widget
    * Before, we've used textFields for validation input and gettinx some texts.
    * However, it's not the best way for this job.
    * You may use Form(...) for more complicated textForms.
    * Form(...) widget is an invisible widget that we can't see (Like column, row, etc). 
    * Inside of the Form() it takes child argument(usually singleChil..+Column or ListView)
    * And instead of TextField you should use TextFormfield(...)

4. More detail focusNode(...)
    * We usually use focusNode() inside of the Form(..)
    * You can define a variable as FocusNode(..) easily.
    * final _titleFocusNode = FocusNode();
    * In stateful widgets when it rebuilds FocusNode(..) causes memory leak.
    * You should dispose your FocusNode objects.
    * Inside of the dispose method of stateful widget you should dispose these objects.
    * With this way you can avoid memory leaks.
5. there are a lot of things in edit_product_screen 
    * Therefore, please check it out occasionally.

[snackBar]: https://blog.iamsuleiman.com/wp-content/uploads/2017/01/snackbar_header.png
[showDialog]: https://newcodingera.com/wp-content/uploads/2019/09/custom-%E2%80%93-1@2x.jpg
