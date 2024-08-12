import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/todo.dart';

class TodoController extends GetxController{

  var todos = <Todo>[].obs;
  TextEditingController todotextController = TextEditingController();

  void addTodo(String title){
    if(title.isNotEmpty){
      todos.add(Todo(title: title));
      
    }
  }


  void removeTO(int index){
    todos.removeAt(index);
  }

  void toggleTodoStatus(int index){
    todos[index].isDone = !todos[index].isDone;
    todos.refresh();
  }
}