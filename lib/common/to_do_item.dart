// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../aggregate/todo.dart';
import '../blocs/bloc_exports.dart';

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
          _buildCheckBox(context),
          _buildDisplayedText(),
          _buildDeleteIcon(context)
        ],
      ),
    );
  }

  IconButton _buildDeleteIcon(BuildContext context) {
    return IconButton(
        onPressed: () {
          showModal(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Are you sure'),
                  content: const Text('Are you sure you want to delete?'),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          context
                              .read<TodoBloc>()
                              .add(DeleteTodo(todo: widget.toDo));
                          Navigator.of(context).pop();
                        },
                        child: const Text('Yes')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('No'))
                  ],
                );
              });
        },
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ));
  }

  Flex _buildDisplayedText() {
    return Flex(
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
    );
  }

  Checkbox _buildCheckBox(BuildContext context) {
    return Checkbox(
        value: widget.toDo.isDone,
        onChanged: (bool? value) {
          context.read<TodoBloc>().add(UpdateTodo(
              todo: ToDo(
                  id: widget.toDo.id,
                  message: widget.toDo.message,
                  isDone: value ?? false)));
        });
  }
}
