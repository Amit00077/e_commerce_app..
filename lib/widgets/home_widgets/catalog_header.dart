import 'package:flutter/material.dart';
import 'package:new_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class Catalogheader extends StatelessWidget {
  const Catalogheader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App"
            .text
            .xl5
            .bold
            .color(Theme.of(context).colorScheme.secondary)
            .make(),
        "Trending products".text.xl2.make()
      ],
    );
  }
}
