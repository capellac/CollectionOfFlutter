import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/main_drawer.dart';
import '../providers/orders.dart';
import '../widgets/order_item.dart' as myWidget;

class OrdersScreen extends StatefulWidget {
  static const routeName = '/orders';

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
    // setState(() {      //Even though we don't need setState because we're in initState and it'll initialize the value to the variable
    //   _isLoading = true;
    // });

    _isLoading = true;
    Provider.of<Orders>(context, listen: false).fetchAndSetOrders().then(     //listen is false so we can use this approach
          (_) => setState(
            () {
              _isLoading = false;
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context, listen: true);
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (ctx, index) => myWidget.OrderItem(
                orders.orders[index],
              ),
            ),
    );
  }
}
