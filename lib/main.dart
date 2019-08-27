import 'package:flutter/material.dart';
import 'package:flutter_state_widget/src/components/add_new_item.dart';
import 'package:flutter_state_widget/src/components/dashboard.dart';
import 'package:flutter_state_widget/src/models/cart.dart';
import './src/components/product_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Cart> _carts = [];

  void _openModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return SingleChildScrollView(
            child: AddNewItem(_addNewItem),
          );
        });
  }

  void _addNewItem(String title, double harga, int qty) {
    final myItem = Cart(
        id: DateTime.now().toString(), title: title, harga: harga, qty: qty);
    setState(() {
      _carts.add(myItem);
    });
  }

  void _resetCarts() {
    setState(() {
      _carts.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          FlatButton(
            child: Icon(
              Icons.clear,
              color: Colors.white,
            ),
            onPressed: () => _resetCarts(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[Dashboard(_carts), ProductList(_carts)],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openModal(context),
      ),
    );
  }
}
