import 'package:flutter/material.dart';

class ModalBottom extends StatelessWidget {
  ModalBottom({super.key, required this.addTask});
  final Function addTask;
  String txtValue = '';
  void hanldeOnClick(BuildContext context) {
    final name = txtValue;
    if (name.isEmpty) {
      return;
    }
    addTask(name);
    Navigator.pop(context);
  }

  /// Using texteditorcontroller instead
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        // height: 200,
        // color: Colors.amber,
        child: Column(
          children: [
            TextField(
              onChanged: (value) => {txtValue = value},
              decoration: InputDecoration(
                labelText: "Your input",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: (() => hanldeOnClick(context)),
                child: const Text("Add"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
