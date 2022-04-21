import 'package:flutter/material.dart';
import 'package:new_app/pages/cart_page.dart';
import 'package:new_app/pages/home_page.dart';
import 'package:new_app/pages/login_page.dart';
import 'package:new_app/utils/routes.dart';
import 'package:new_app/widgets/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      themeMode: ThemeMode.light,
      theme: Mytheme.lighttheme(context),
      darkTheme: Mytheme.darktheme(context),

      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const loginpage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const loginpage(),
        MyRoutes.cartRoute: (context) => const CartPage()
      },
    );
  }
}
