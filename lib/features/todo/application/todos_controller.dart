import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_app/features/todo/application/todos_state.dart';

import '../domain/todo.dart';

part 'todos_controller.g.dart';

@riverpod
class TodosController extends _$TodosController {
  @override
  TodosState build() {
    return TodosState.initial();
  }

  void addTodo(String title) {
    final trimmedTitle = title.trim();

    if (trimmedTitle.isEmpty) {
      print("Please provide a title");
      return;
    }
    final todo = Todo(
      title: trimmedTitle,
      isCompleted: false,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
    );

    state = state.copyWith(
      todos: <Todo>[...state.todos, todo],
    );
  }

  void toggleTodo(String id) {
    // Explicitly type .map<Todo> so it returns List<Todo> instead of List<dynamic>
    final updatedTodo = state.todos.map<Todo>((todo) {
      if (todo.id != id) {
        return todo;
      }
      return todo.copyWith(isCompleted: !todo.isCompleted);
    }).toList();

    state = state.copyWith(
      todos: updatedTodo,
    );
  }

  void deleteTodo(String id) {
    final updatedTodos = state.todos.where((todo) => todo.id != id).toList();
    state = state.copyWith(
      todos: updatedTodos,
    );
  }

  void updateTodo(String id, String title) {
    final todoExists = state.todos.any((todo) => todo.id == id);

    if (!todoExists) {
      state = state.copyWith(
        errorMessage: "Todo not found",
      );
      print("Todo not found");
      return;
    }

    final trimmedTitle = title.trim();
    if (trimmedTitle.isEmpty) {
      print("Please provide a title");
      return;
    }

    // Explicitly type .map<Todo>
    final updatedTodos = state.todos.map<Todo>((todo) {
      if (todo.id != id) {
        return todo;
      }
      return todo.copyWith(title: title);
    }).toList();

    state = state.copyWith(
      todos: updatedTodos,
      errorMessage: null,
    );
  }
}