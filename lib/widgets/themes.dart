import 'package:flutter/material.dart';

class Mytheme {
  static ThemeData lighttheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ));
  static ThemeData darktheme(BuildContext context) =>
      ThemeData(brightness: Brightness.dark);
  static const Color creamcolor = Color(0xfff5f5f5);
  static const Color bluish = Color(0xff403b55);
}
