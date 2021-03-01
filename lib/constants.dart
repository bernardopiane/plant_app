import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

const double spacing_1 = 16;

const double spacing_2 = 24;

const Color greyColor = Color(0xff213e3b);

const Color orangeColor = Color(0xffff7e67);

const Color inactiveColor = Color(0xff4d969a);

const Color subTextColor = Color(0xff859896);

enum PAGE {
  HOME,
  CART,
}

class Item {
  String title;
  String name;
  String category;
  String description;
  String image;

  Item(this.title, this.name, this.category, this.description, this.image);
}

// return CartList([
//   Item("High Protein Breakfast", "FOR ADULTS & KIDS", "7 foods item available for breakfast today", "images/Image.png"),
//   Item("Low Fat Lunch", "FOR ADULTS & KIDS", "7 foods item available for lunch today.", "images/Image2.png"),
// ]);

class CartList extends StateNotifier<List<Item>> {
  CartList() : super([]);

  void addItem(Item item) {
    state = [...state, item];
  }

  void removeIndex(int index) {
    state.removeAt(index);
  }

// CartList() : super(0);
}
