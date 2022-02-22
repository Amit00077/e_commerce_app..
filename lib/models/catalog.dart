// import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';

class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "iPhone 12 pro",
        desc: "Apple iPhone 12th generation",
        price: 999,
        color: "",
        image: "https://m.media-amazon.com/images/I/71MHTD3uL4L.jpg")
  ];
}

class Item {
  final num id;
  final String desc;
  final String name;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
