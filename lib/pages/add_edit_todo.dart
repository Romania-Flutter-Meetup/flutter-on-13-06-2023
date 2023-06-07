// ignore_for_file: unused_element

import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../common/todo_appbar.dart';
import '../models/todo.dart';
import '../services/notification_service.dart';
import '../services/uuid_generator.dart';
import '../theme/app_theme.dart';

class AddOrEditTodo extends StatefulWidget {
  const AddOrEditTodo({super.key, this.todo});
  static const String routeName = '/addOrEdit';
  final ToDo? todo;

  @override
  State<AddOrEditTodo> createState() => _AddOrEditTodoState();
}

class _AddOrEditTodoState extends State<AddOrEditTodo> {
  TextEditingController todoText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      if (widget.todo != null) {
        todoText = TextEditingController(text: widget.todo!.message);
      }
    }

    @override
    void dispose() {
      todoText.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: TodoAppBar(
        title: widget.todo == null ? 'Add ToDo' : 'Edit ToDo',
        isLandingPage: false,
        actions: const <Widget>[],
      ),
      body: Column(children: <Widget>[
        SizedBox(
          height: context.height * 0.2,
        ),
        _buildToDoField(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  if (todoText.text.isEmpty) {
                    NotificationService.showErrorNotification(
                        'Field is required', context);
                  } else {
                    widget.todo == null
                        ? context.read<TodoBloc>().add(AddToDo(
                            todo: ToDo(
                                id: UuidGenerator.getId(),
                                message: todoText.text,
                                isDone: false)))
                        : context.read<TodoBloc>().add(UpdateTodo(
                            todo: ToDo(
                                id: widget.todo!.id,
                                message: todoText.text,
                                isDone: widget.todo!.isDone)));
                    NotificationService.showSuccessNotification(
                        'Good job', context);
                  }
                },
                child: const Text('Save'))
          ],
        )
      ]),
    );
  }

  Widget _buildToDoField() {
    return TextField(
      controller: todoText,
      decoration: const InputDecoration(
          border: AppTheme.inputOutlineBorder,
          labelText: 'Todo',
          hintText: 'Hint: enter your task'),
    );
  }
}
