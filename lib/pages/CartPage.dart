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
            final items = watch(cartListProvider.state);

            return Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items.elementAt(index);

                  return Dismissible(
                    key: Key(item.toString()),
                    background: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Icon(Icons.delete),
                      ),
                    ),
                    onDismissed: (direction) {
                      context.read(cartListProvider).removeIndex(index);
                    },
                    child: ListTile(
                      title: Text(item.title),
                    ),
                  );
                },
              ),
            );
          }),
          MyBottomBar(PAGE.CART),
        ],
      ),
    );
  }
}
