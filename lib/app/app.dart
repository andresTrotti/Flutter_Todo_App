import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_todo_app/core/theme/app_theme.dart';

import '../features/todo/presentation/screens/todo_screen.dart';
import 'package:flutter/material.dart'; //

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.themeData,
      home: TodoScreen()
    );
  }
}