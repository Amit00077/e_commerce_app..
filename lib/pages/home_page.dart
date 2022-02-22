import 'package:flutter/material.dart';
import 'package:new_app/models/catalog.dart';
import 'package:new_app/widgets/widgets.dart';
import 'package:new_app/widgets/itemwidgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Catalog App",
        style: TextStyle(color: Colors.black),
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidgets(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
