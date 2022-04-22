import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Mytheme {
  static ThemeData lighttheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      cardColor: Colors.white,
      canvasColor: creamcolor,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: bluish),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ));
  static ThemeData darktheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        cardColor: Colors.black,
        canvasColor: darkcreamcolor,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: creamcolor),
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              color: Colors.white,
              elevation: 0.0,
              iconTheme: const IconThemeData(color: Colors.white),
            ),
      );
  static const Color creamcolor = Color(0xfff5f5f5);
  static const Color bluish = Color(0xff403b55);
  static const Color darkcreamcolor = Color.fromARGB(255, 47, 68, 79);
  static const Color lightbluish = Vx.indigo400;
}
