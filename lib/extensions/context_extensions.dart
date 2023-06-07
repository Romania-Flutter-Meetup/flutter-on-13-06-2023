import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get widht => mediaQuery.size.width;
  double get height => mediaQuery.size.height;
}
