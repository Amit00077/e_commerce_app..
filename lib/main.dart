import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_app/core/store.dart';
import 'package:new_app/pages/cart_page.dart';
import 'package:new_app/pages/home_page.dart';
import 'package:new_app/pages/login_page.dart';
import 'package:new_app/utils/routes.dart';
import 'package:new_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const loginpage(),
      themeMode: ThemeMode.system,
      theme: Mytheme.lighttheme(context),
      darkTheme: Mytheme.darktheme(context),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => const loginpage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const loginpage(),
        MyRoutes.cartRoute: (context) => const CartPage()
      },
    );
  }
}
