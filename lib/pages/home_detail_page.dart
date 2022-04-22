import 'package:flutter/material.dart';
import 'package:new_app/models/catalog.dart';
import 'package:new_app/widgets/home_widgets/add_to_cart.dart';
import 'package:new_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.bold.xl4.red800.make(),
              AddToCart(
                catalog: catalog,
              ).wh(120, 50)
            ]).p32(),
      ),
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.network(catalog.image))
                  .h32(context),
              Expanded(
                  child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(Theme.of(context).colorScheme.secondary)
                          .bold
                          .make(),
                      catalog.desc.text.xl.make(),
                      10.heightBox,
                      "Lorem accusam duo diam gubergren amet nonumy ,"
                          .richText
                          .sm
                          .make()
                          .expand()
                    ],
                  ).p64(),
                ),
              ))
            ],
          )),
    );
  }
}
