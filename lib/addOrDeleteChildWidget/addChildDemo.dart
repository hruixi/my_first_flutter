import 'package:flutter/material.dart';

class AddChildWidget extends StatefulWidget {
  const AddChildWidget({Key? key}) : super(key: key);

  @override
  AddChildWidgetState createState() => AddChildWidgetState();
}

class AddChildWidgetState extends State<AddChildWidget> {
  // Default value for toggle
  bool toggle = true;

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return const Text('Toggle One');
    } else {
      return MaterialButton(onPressed: () {}, child: const Text('Toggle Two'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("龙生九子"),
      ),
      body: Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: const Icon(Icons.update),
      ),
    );
  }
}
