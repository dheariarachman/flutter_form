import 'package:flutter/material.dart';

class AddNewItem extends StatefulWidget {

  final Function addNew;
  AddNewItem(this.addNew);

  @override
  _AddNewItemState createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {

  final titleController = TextEditingController();
  final hargaController = TextEditingController();
  final qtyController   = TextEditingController();

  void saveNewitem() {
    final title = titleController.text;
    final harga = hargaController.text;
    final qty = int.parse(qtyController.text);

    if (title.isEmpty || harga.isEmpty || qty <= 0) {
      return;      
    }

    widget.addNew(title, double.parse(harga), qty);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8.0),
        
      ),
    );
  }
}