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
  final qtyController = TextEditingController();

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
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Nama Barang'),
            controller: titleController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Quantity'),
            controller: qtyController,
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Harga'),
            controller: hargaController,
            keyboardType: TextInputType.number,
          ),
          FlatButton(
              child: Text('Tambah'),
              onPressed: saveNewitem,
              textColor: Colors.blueAccent)
        ],
      ),
    );
  }
}
