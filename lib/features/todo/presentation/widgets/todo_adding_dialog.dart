import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef AddTodoCallback = void Function(String title);

class TodoAddingDialog extends StatefulWidget {
  const TodoAddingDialog({super.key, required this.onAddTodo});
  final AddTodoCallback onAddTodo;

  @override
  State<TodoAddingDialog> createState() => _TodoAddingDialogState();
}

class _TodoAddingDialogState extends State<TodoAddingDialog> {
  final textController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min, //base on the context size of the parent
          children: [
            // Title
            Text("New Todo", style: textTheme.titleLarge ),
            SizedBox(height: 20),
            TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: "What needs to be done?",
              )
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Close"),
                ),
                ElevatedButton(
                  onPressed: () {
                    final title = textController.text;
                    if (title.trim().isEmpty) {
                     ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(content: Text("Please enter some title"))
                     );
                     return;
                    }
                    widget.onAddTodo(title);
                    Navigator.of(context).pop();


                  },
                  child: Text("Add"),
                )
              ]
            )
          ],
        ),
      ),

    );
  }
}
