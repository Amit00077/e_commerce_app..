import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/core/store.dart';
import 'package:new_app/models/cart.dart';
import 'package:new_app/models/catalog.dart';
import 'package:new_app/utils/routes.dart';
import 'package:new_app/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

@override
class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: context.canvasColor,
      ),
      backgroundColor: context.canvasColor,
      floatingActionButton: VxConsumer(
        notifications: const {},
        mutations: const {AddMutation, RemoveMutation},
        builder: (context, _, _l) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: const Color.fromARGB(255, 71, 179, 219),
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            color: const Color.fromARGB(255, 231, 110, 99),
            size: 20,
            textStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
            count: _cart.items.length),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Catalogheader(),
              if (CatalogModel.items.isNotEmpty)
                const CatalogList().py16().expand()
              else
                const CircularProgressIndicator().centered().expand().py16(),
            ],
          ),
        ),
      ),
    );
  }
}
