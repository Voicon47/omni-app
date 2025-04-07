import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({
    super.key,
    required this.index,
    required this.item,
    required this.deleteTask,
  });
  final Function deleteTask;
  var item;
  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: index % 2 == 0 ? Colors.amber : Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 74,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  deleteTask(item.id);
                }
                return print("Pressed Cancle");
              },
              child: Icon(Icons.delete_outline, color: Colors.white, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
