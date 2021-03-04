import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/main.dart';
import 'package:plant_app/utils.dart';

class DetailsPage extends StatelessWidget {
  final double radius = 88;

  @override
  Widget build(BuildContext context) {
    final borderBottom = BorderRadius.only(bottomLeft: Radius.circular(radius), bottomRight: Radius.circular(radius));

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffecf4f3),
        body: Stack(
          children: [
            ScrollConfiguration(
              behavior: MyBehavior(),
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      //Here goes the same radius, u can put into a var or function
                      borderRadius: borderBottom,
                      color: Color(0xfff0f7fa),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 4,
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: borderBottom,
                      child: Stack(
                        children: [
                          Align(
                            child: Image(
                              height: 416,
                              image: AssetImage("images/plant.png"),
                            ),
                            alignment: Alignment.center,
                          ),
                          Positioned.fill(
                            top: 24,
                            right: 16,
                            left: 16,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Material(
                                    borderRadius: BorderRadius.circular(32),
                                    color: Colors.transparent,
                                    child: InkWell(
                                        borderRadius: BorderRadius.circular(32),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.arrow_back),
                                        )),
                                  ),
                                  Material(
                                    borderRadius: BorderRadius.circular(32),
                                    color: Colors.transparent,
                                    child: InkWell(
                                        borderRadius: BorderRadius.circular(32),
                                        onTap: () {
                                          Navigator.popAndPushNamed(context, '/cart');
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.shopping_cart),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: spacing_2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: spacing_2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bonsai",
                              style: TextStyle(color: subTextColor, fontWeight: FontWeight.w800),
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Ficus retusa",
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: " (Office Plant)",
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(color: Color(0xffff7e67), borderRadius: BorderRadius.circular(8)),
                          child: Material(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.transparent,
                            child: Consumer(
                              builder: (context, watch, _) {
                                return InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: () {
                                    context.read(favListProvider).addItem(Item(
                                          "Item Teste",
                                          "Item Teste",
                                          "Item Teste",
                                          "Item Teste",
                                          "Item Teste",
                                        ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      // favList.contains(currentItem) ? Icons.favorite_border : Icons.favorite,
                                      Icons.favorite,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: spacing_2, vertical: 32),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque at magna quis sem cursus vulputate. Donec ut magna bibendum, "
                      "rhoncus lectus ut, maximus dolor.",
                      style: TextStyle(color: subTextColor, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: spacing_2),
                    child: Text(
                      "Treatment",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: spacing_2, vertical: spacing_2),
                    child: Row(
                      children: [
                        TreatmentIcon(icon: Icon(Icons.wb_sunny)),
                        TreatmentIcon(icon: Icon(Icons.wb_sunny)),
                        TreatmentIcon(icon: Icon(Icons.wb_sunny)),
                        TreatmentIcon(icon: Icon(Icons.wb_sunny)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 64,
                  )
                ],
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 72,
                  width: 256,
                  decoration: BoxDecoration(color: orangeColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(64))),
                  child: Material(
                    color: Colors.transparent,
                    child: Consumer(
                      builder: (context, ScopedReader watch, _) {
                        return InkWell(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(64)),
                          onTap: () {
                            context.read(cartListProvider).addItem(Item(
                                  "Item Teste",
                                  "Item Teste",
                                  "Item Teste",
                                  "Item Teste",
                                  "Item Teste",
                                ));
                          },
                          child: Center(
                              child: Text(
                            "Buy \$60",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          )),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TreatmentIcon extends StatelessWidget {
  const TreatmentIcon({
    Key key,
    this.icon,
  }) : super(key: key);

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: icon,
        ),
      ),
    );
  }
}
