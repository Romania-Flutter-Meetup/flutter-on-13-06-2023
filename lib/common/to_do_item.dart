// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/todo.dart';

class ToDoItem extends StatefulWidget {
  const ToDoItem({
    super.key,
    required this.toDo,
  });
  final ToDo toDo;

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Checkbox(
              value: widget.toDo.isDone,
              onChanged: (bool? value) {
                context.read<TodoBloc>().add(UpdateTodo(
                    todo: ToDo(
                        id: widget.toDo.id,
                        message: widget.toDo.message,
                        isDone: value ?? false)));
              }),
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Text(
                widget.toDo.message,
                style: TextStyle(
                    fontSize: 16,
                    decoration: widget.toDo.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              )
            ],
          ),
          IconButton(
              onPressed: () {
                context.read<TodoBloc>().add(DeleteTodo(todo: widget.toDo));
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
