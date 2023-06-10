import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../aggregate/todo.dart';
import '../assets/assets.dart';
import '../blocs/bloc_exports.dart';
import '../common/to_do_item.dart';
import '../common/todo_appbar.dart';
import '../common/ui_percent.dart';
import 'add_edit_todo.dart';
import 'settings_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TodoAppBar(
        title: 'Todos',
        isLandingPage: true,
        actions: <Widget>[
          _buildSettingsButton(context),
          _buildClearAll(context)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[_buildIntroAnimation(), _buildToDoList()]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddOrEditTodo.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Column _buildToDoList() {
    return Column(
      children: <Widget>[
        BlocBuilder<TodoBloc, TodoState>(
          builder: (BuildContext context, TodoState state) {
            return state.allToDos.isNotEmpty
                ? UiPercent(
                    widget: ListView(
                        children: state.allToDos
                            .map((ToDo e) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ToDoItem(toDo: e),
                                ))
                            .toList()),
                    widthPercent: 0.9,
                    heightPercent: 0.3)
                : _buildNoItemsFound(context);
          },
        )
      ],
    );
  }

  Row _buildIntroAnimation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        UiPercent(
            widget: Lottie.asset(Assets.INTRO_ANIMATION),
            widthPercent: 0.6,
            heightPercent: 0.3)
      ],
    );
  }

  IconButton _buildSettingsButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pushNamed(SettingsPage.routeName);
        },
        icon: const Icon(Icons.settings));
  }

  IconButton _buildClearAll(BuildContext context) {
    return IconButton(
        onPressed: () {
          showModal(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Clear all'),
                  content: const Text('Are you sure you want to clear all?'),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          context.read<TodoBloc>().add(DeleteAllTodo());
                          Navigator.pop(context);
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
        icon: const Icon(Icons.clear_all));
  }

  Column _buildNoItemsFound(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        UiPercent(
            widthPercent: 1,
            heightPercent: 0.4,
            widget: Lottie.asset(Assets.NO_ITEMS)),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'No items found',
              style: TextStyle(fontSize: 18),
            )
          ],
        )
      ],
    );
  }
}
