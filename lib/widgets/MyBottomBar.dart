import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/main.dart';
import 'package:plant_app/pages/CartPage.dart';

class MyBottomBar extends ConsumerWidget {
  const MyBottomBar(
    this.page, {
    Key key,
  }) : super(key: key);

  final page;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var item = watch(cartListProvider.state);
    return Container(
      decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)]),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.home,
              color: page == PAGE.HOME ? Colors.white : inactiveColor,
            ),
            Icon(Icons.favorite, color: inactiveColor),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
              child: Badge(
                badgeContent: Text(item.length.toString()),
                child: Icon(Icons.shopping_cart, color: page == PAGE.CART ? Colors.white : inactiveColor),
              ),
            ),
            Icon(Icons.settings, color: inactiveColor),
          ],
        ),
      ),
    );
  }
}
