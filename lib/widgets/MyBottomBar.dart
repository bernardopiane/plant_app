import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/main.dart';
import 'package:plant_app/pages/CartPage.dart';
import 'package:plant_app/pages/FavoritesPage.dart';

class MyBottomBar extends StatelessWidget {
  const MyBottomBar(
    this.page, {
    Key key,
  }) : super(key: key);

  final page;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            splashRadius: 24,
            onPressed: () {
              if (page != PAGE.HOME) Navigator.popUntil(context, (route) => route.isFirst);
            },
            icon: Icon(
              Icons.home,
              color: page == PAGE.HOME ? Colors.white : inactiveColor,
            ),
          ),
          IconButton(
            splashRadius: 24,
            onPressed: () {
              if (page != PAGE.FAV)
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => FavoritesPage()),
                );
            },
            icon: Icon(
              Icons.favorite,
              color: page == PAGE.FAV ? Colors.white : inactiveColor,
            ),
          ),
          IconButton(
              splashRadius: 24,
              onPressed: () {
                if (page != PAGE.CART)
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => CartPage()),
                  );
              },
              icon: Consumer(
                builder: (context, watch, _) {
                  var item = watch(cartListProvider.state);

                  return Badge(
                    badgeContent: Text(
                      item.length <= 9 ? item.length.toString() : "+9",
                      style: TextStyle(fontSize: 10),
                    ),
                    child: Icon(Icons.shopping_cart, color: page == PAGE.CART ? Colors.white : inactiveColor),
                  );
                },
              )),
          Icon(Icons.settings, color: inactiveColor),
        ],
      ),
    );
  }
}
