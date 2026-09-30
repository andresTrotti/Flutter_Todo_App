import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_app/features/todo/application/todos_controller.dart';
import 'package:riverpod_todo_app/features/todo/domain/todo.dart'; // Make sure Todo is imported

part 'completed_todos_provider.g.dart';

@riverpod
int completedTodosCount(Ref ref) {
  // Explicitly annotate with List<Todo>
  final List<Todo> todos = ref.watch(
    todosControllerProvider.select((state) => state.todos),
  );

  return todos.where((todo) => todo.isCompleted).length;
}