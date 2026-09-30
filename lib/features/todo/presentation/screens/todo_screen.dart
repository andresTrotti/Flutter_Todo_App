
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_app/features/todo/application/completed_todos_provider.dart';
import 'package:riverpod_todo_app/features/todo/application/todos_controller.dart';
import 'package:riverpod_todo_app/features/todo/presentation/widgets/overview_card.dart';
import 'package:riverpod_todo_app/features/todo/presentation/widgets/todo_adding_dialog.dart';
import 'package:riverpod_todo_app/features/todo/presentation/widgets/todo_tile.dart';

import '../widgets/update_todo_dialog.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state = ref.watch(todosControllerProvider);
    final completedCount = ref.watch(completedTodosCountProvider);
    final todos = state.todos;
    final isLoading = state.isLoading;
    final errorMessage = state.errorMessage;


    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
        centerTitle: true,
      ),
        body: isLoading ? Center(child: CircularProgressIndicator())
            : errorMessage != null
            ? Center(child: Text(errorMessage))
            : todos.isEmpty ? Center(child: Text("No todos"))
            : SafeArea(
            child: Padding(padding: const EdgeInsetsGeometry.all(8.0),
                child: Column(
                  children: [
                    //Overview card
                    OverviewCard(
                        completedCount: completedCount,
                        totalTodosCount: todos.length
                    ),
                    SizedBox(height: 12),
                    //Todo Tasks list 
                    Expanded(
                        child: ListView.builder(
                          itemCount: todos.length,
                            itemBuilder: (context, index){
                              return TodoTile(
                                todo: todos[index],
                                onToggleTodo: () {
                                  ref.read(todosControllerProvider.notifier).toggleTodo(todos[index].id);
                                },
                                onDeleteTodo: () {
                                  ref.read(todosControllerProvider.notifier).deleteTodo(todos[index].id);
                                },
                                onUpdateTodo: () {
                                  showDialog(context: context, builder: (context) => UpdateTodoDialog(
                                      title: todos[index].title,
                                      onUpdateTodo: (title) {
                                        ref.read(todosControllerProvider.notifier).updateTodo(todos[index].id, title);
                                      },
                                    ));
                                },
                              );
                            }
                    ))
                  ],
                )
            ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
              context: context,
              builder: (context) => TodoAddingDialog(
                onAddTodo: (title) => ref.read(todosControllerProvider.notifier).addTodo(title),
              )
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}



