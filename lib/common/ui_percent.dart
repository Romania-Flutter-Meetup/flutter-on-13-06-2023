import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';

class UiPercent extends StatelessWidget {
  const UiPercent(
      {super.key,
      required this.widget,
      required this.widthPercent,
      required this.heightPercent});
  final Widget widget;
  final double widthPercent;
  final double heightPercent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.widht * widthPercent,
      height: context.height * heightPercent,
      child: widget,
    );
  }
}
