// ignore_for_file: avoid_field_initializers_in_const_classes

import 'package:flutter/material.dart';

class TodoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TodoAppBar(
      {super.key,
      required this.title,
      required this.isLandingPage,
      required this.actions})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  final String title;
  final bool isLandingPage;
  final List<Widget> actions;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(title),
        actions: actions,
        leading: !isLandingPage
            ? IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back))
            : Container());
  }
}
