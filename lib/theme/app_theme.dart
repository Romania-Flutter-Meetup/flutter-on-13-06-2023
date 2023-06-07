import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ms_material_color/ms_material_color.dart';

class AppTheme {
  static const Color primaryColor = Color.fromRGBO(31, 98, 175, 1);
  static const Color darkPrimaryColor = Color.fromRGBO(28, 79, 138, 1);

  static const Color blackTextColor = Colors.black;
  static const Color whiteTextColor = Colors.white;
  static const Color greyTextColor = Color.fromRGBO(143, 143, 143, 1);

  static const OutlineInputBorder inputOutlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(color: Colors.transparent));

  static ThemeData getLightTheme(BuildContext context) {
    final ThemeData lightTheme = ThemeData(
      primarySwatch: MsMaterialColor.fromRGBO(31, 98, 175, 1),
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSwatch(
          accentColor: Colors.cyan,
          backgroundColor: const Color.fromRGBO(230, 230, 230, 1)),
      scaffoldBackgroundColor: Colors.white,
      textTheme: GoogleFonts.jostTextTheme(Theme.of(context).textTheme)
          .apply(bodyColor: blackTextColor, displayColor: blackTextColor),
    );
    return lightTheme;
  }

  static ThemeData getDarkTheme(BuildContext context) {
    final ThemeData darkTheme = ThemeData(
      primarySwatch: MsMaterialColor.fromRGBO(28, 79, 138, 1),
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
          accentColor: Colors.cyan,
          backgroundColor: MsMaterialColor.fromRGBO(16, 23, 42, 1)),
      scaffoldBackgroundColor: const Color.fromRGBO(16, 23, 42, 1),
      textTheme: GoogleFonts.jostTextTheme(Theme.of(context).textTheme)
          .apply(bodyColor: whiteTextColor, displayColor: whiteTextColor),
    );
    return darkTheme;
  }
}
