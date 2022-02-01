import 'package:flutter/material.dart';
import 'package:new_app/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Catalog App",
        style: TextStyle(color: Colors.black),
      )),
      body: Center(
        child: Container(child: const Text("Welcome to our project")),
      ),
      drawer: MyDrawer(),
    );
  }
}
