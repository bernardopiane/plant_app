import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/main.dart';
import 'package:plant_app/widgets/MyBottomBar.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00686f),
      body: Column(
        children: [
          Consumer(builder: (context, ScopedReader watch, _) {
            final item = watch(cartListProvider.state);
            List<Widget> widgets = new List<Widget>();
            for (var atual in item) {
              widgets.add(ListTile(title: Text(atual.title)));
            }
            return Expanded(child: ListView(children: widgets));
          }),
          MyBottomBar(PAGE.CART),
        ],
      ),
    );
  }
}
