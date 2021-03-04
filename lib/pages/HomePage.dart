import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/widgets/AddToCartButton.dart';
import 'package:plant_app/widgets/MyBottomBar.dart';

import 'DetailsPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00686f),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(), // Remove scrollglow do listview
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        Image(
                          image: AssetImage("images/profile pic.png"),
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: spacing_1),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.white,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(16),
                                  border: InputBorder.none,
                                  hintText: 'Search',
                                  hintStyle: TextStyle(color: Colors.grey.shade400),
                                  suffixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey.shade400,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xffff7e67),
                          ),
                          child: new Material(
                            child: new InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                print("tapped");
                              },
                              child: new Container(
                                width: 48.0,
                                height: 48.0,
                                child: Icon(
                                  Icons.settings_input_composite,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: spacing_2),
                  Categories(),
                  SizedBox(height: spacing_2),
                  Container(
                    height: 256,
                    child: ListView(
                      children: [
                        SizedBox(width: 24),
                        CategoryItem(
                          image: "images/1.jpg",
                          name: "Planta 2",
                        ),
                        CategoryItem(
                          image: "images/2.jpg",
                          name: "Planta 1",
                        ),
                        CategoryItem(
                          image: "images/3.jpg",
                          name: "Planta 1",
                        ),
                        CategoryItem(
                          image: "images/plant.png",
                          name: "Planta 1",
                        ),
                        CategoryItem(
                          image: "images/planta2.png",
                          name: "Planta 1",
                        ),
                        SizedBox(width: 24),
                      ],
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(height: spacing_2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular",
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(Icons.more_horiz, color: Colors.white)
                      ],
                    ),
                  ),
                  SizedBox(height: spacing_2),
                  SizedBox(
                    height: 84,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(width: 24),
                        ItemChip(image: "images/1.jpg", name: "Name", value: 75.00),
                        ItemChip(image: "images/2.jpg", name: "Name", value: 75.00),
                        ItemChip(image: "images/3.jpg", name: "Name", value: 75.00),
                        ItemChip(image: "images/plant.png", name: "Name", value: 75.00),
                        SizedBox(width: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            MyBottomBar(PAGE.HOME),
          ],
        ),
      ),
    );
  }
}

class ItemChip extends StatelessWidget {
  const ItemChip({Key key, this.image, this.name, this.value}) : super(key: key);

  final String image;
  final String name;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AspectRatio(
        aspectRatio: 5 / 2,
        child: Container(
          // width: 192,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: Image(
                        image: AssetImage(image),
                        height: 64,
                        width: 64,
                        alignment: Alignment.center,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(name),
                        Text(
                          "\$$value",
                          style: TextStyle(color: subTextColor),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned.fill(
                  right: 8,
                  bottom: 8,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: AddToCartButton(height: 24, width: 24),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends ConsumerWidget {
  const CategoryItem({
    Key key,
    this.image,
    this.name,
  }) : super(key: key);

  final String image;
  final String name;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(32),
        ),
        child: AspectRatio(
          aspectRatio: 2 / 3,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => DetailsPage()),
                );
              },
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(image),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      child: Text(name),
                      alignment: Alignment.bottomCenter,
                    ),
                    bottom: 16,
                  ),
                  Positioned.fill(
                    top: 8,
                    right: 8,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: AddToCartButton(height: 32, width: 32),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CategoryItem("All", 0),
          CategoryItem("Outdoor", 1),
          CategoryItem("Indoor", 2),
          CategoryItem("Office", 3),
          CategoryItem("Garden", 4),
          //Filtrar os featureds baseados nas tag
        ],
      ),
    );
  }

  CategoryItem(name, value) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _selected = value;
            });
          },
          child: Text(
            name,
            style: TextStyle(color: _selected == value ? Colors.white : Color(0xff66a4a9)),
          ),
        ),
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: _selected == value ? Color(0xffff7e67) : Colors.transparent,
          ),
        )
      ],
    );
  }
}
