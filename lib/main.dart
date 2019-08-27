import 'package:flutter/material.dart';
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

  final List<Cart> _carts = [
    Cart(id: 'DW1', title: 'Sabun Mandi', harga: 15000, qty: 1),
    Cart(id: 'DW2', title: 'Shampoo', harga: 17000, qty: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Dashboard(_carts),
            ProductList(_carts)
          ],
        ),
      )
    );
  }
}
