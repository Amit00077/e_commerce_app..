import 'dart:convert';

class CatalogModel {
  static List<Item> items = items;
  static Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);
  static Item getByPosition(int pos) => items[pos];
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
