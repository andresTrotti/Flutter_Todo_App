import 'package:flutter/material.dart';

import '../../domain/todo.dart';

class TodoTile extends StatelessWidget{
  const TodoTile({super.key, required this.todo, required this.onToggleTodo, required this.onDeleteTodo, required this.onUpdateTodo});
  final Todo todo;
  final VoidCallback onToggleTodo;
  final VoidCallback onDeleteTodo;
  final VoidCallback onUpdateTodo;



  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Checkbox(
                shape: CircleBorder(),
                value: todo.isCompleted,
                onChanged: (_){
                  onToggleTodo();
                }
            ),
            Expanded(
              child: Text(todo.title, style: textTheme.titleMedium?.copyWith(
                decoration: todo.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
              )),
            ),
            IconButton(onPressed: onUpdateTodo, icon: Icon(Icons.edit)),
            IconButton(onPressed: (){
              onDeleteTodo();
            }, icon: Icon(Icons.delete)),

            SizedBox(width: 12),
          ],
        ),
      ),


    );
  }
}