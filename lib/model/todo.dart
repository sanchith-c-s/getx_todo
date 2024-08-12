import 'package:flutter/material.dart';

class Todo {
  String title;
  bool isDone;

  Todo({
    required this.title,
    this.isDone=false,
  });
}