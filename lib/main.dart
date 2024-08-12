import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/todo_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: TodoPage()
    );
  }
}
