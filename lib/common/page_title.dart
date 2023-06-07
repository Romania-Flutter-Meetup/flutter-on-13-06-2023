import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          )
        ],
      ),
    );
  }
}
