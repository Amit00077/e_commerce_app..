// import 'package:flutter/cupertino.dart';

// import 'package:flutter/cupertino.dart';

class CatalogModel {
  static List<Item> items = [
    Item(
        id: 1,
        name: "iPhone 12 pro",
        desc: "Apple iPhone 12th generation",
        price: 999,
        color: "#33505a",
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
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        image: map["image"]);
  }
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image
      };
}
