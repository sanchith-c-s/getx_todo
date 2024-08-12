import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/controllers/todo_controller.dart';

class TodoPage extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController());
  TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Getx app'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todoController.addTodo(todoController.todotextController.text);
          todoController.todotextController.clear();
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
              child: Obx(() => ListView.builder(
                  itemCount: todoController.todos.length,
                  itemBuilder: (context, index) {
                    final todo = todoController.todos[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // ignore: sort_child_properties_last
                        child: ListTile(
                          title: Text(
                            todo.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: todo.isDone
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none),
                          ),
                          leading: Checkbox(
                              value: todo.isDone,
                              onChanged: (value) {
                                todoController.toggleTodoStatus(index);
                              }),
                          trailing: IconButton(
                              onPressed: () {
                                print('action');
                                todoController.removeTO(index);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.blue[200]),
                      ),
                    );
                  }))),
          Row(
            children: [
              Expanded(
                  child: TextField(
                controller: todoController.todotextController,
                decoration: InputDecoration(labelText: 'Add a Task'),
              ))
            ],
          )
        ],
      ),
    );
  }
}
