import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/main.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key key,
    this.height,
    this.width,
    this.item,
  }) : super(key: key);

  final double height;
  final double width;
  final Item item;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(64),
      child: Container(
        height: height,
        width: width,
        color: Color(0xffff7e67),
        child: Material(
          color: Colors.transparent,
          child: Consumer(
            builder: (context, ScopedReader watch, _) {
              return InkWell(
                onTap: () {
                  //Passar Item
                  context.read(cartListProvider).addItem(Item(
                        "Item Teste",
                        "Item Teste",
                        "Item Teste",
                        "Item Teste",
                        "Item Teste",
                      ));
                },
                child: Icon(
                  Icons.add,
                  size: 16,
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
