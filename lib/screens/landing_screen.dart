import 'package:flutter/material.dart';
import 'package:food_app/screens/product_item.dart';
import 'package:food_app/utils/constants.dart';

import '../utils/widget_functions.dart';

const PRODUCT_DATA = [
  {
    "image": "pizza.png",
    "name": "Pizza",
    "rest": "Maritine Star Restaurant",
    "rating": "4.5 (164)",
    "price": 20,
    "currency": "\$"
  },
  {
    "image": "burger.png",
    "name": "Burger",
    "rest": "Maritine Star Restaurant",
    "rating": "4.7 (199)",
    "price": 10,
    "currency": "\$"
  },
  {
    "image": "fries.png",
    "name": "Fries",
    "rest": "Maritine Star Restaurant",
    "rating": "4.2 (101)",
    "price": 10,
    "currency": "\$"
  },
  {
    "image": "hotdog.png",
    "name": "HotDog",
    "rest": "Maritine Star Restaurant",
    "rating": "3.9 (150)",
    "price": 15,
    "currency": "\$"
  },
];

const CATEGORIES = [
  {"image": "salad.png", "name": "Salad"},
  {"image": "fastfood.png", "name": "Fast Food"},
  {"image": "desert.png", "name": "Desert"},
  {"image": "drinks.png", "name": "Drinks"},
  {"image": "drinks.png", "name": "Drinks"},
];

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: constraints.maxHeight * 0.40,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        color: COLOR_GREEN,
                      ),
                      Image.asset('assets/images/tree_v.png'),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            addVerticalSpace(1),
                            Row(
                              children: [
                                Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child:
                                        Image.asset('assets/images/avatar.png'),
                                  ),
                                ),
                                addHorizontalSpace(20),
                                Expanded(
                                    child: Text(
                                  "How hungry are you today?",
                                  style: textTheme.headline5
                                      ?.apply(color: Colors.white),
                                )),
                              ],
                            ),
                            TextField(
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                  hintText: 'Search food items',
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.white24,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomRight:
                                                Radius.circular(20.0))),
                                    child: Icon(
                                      Icons.menu,
                                      color: Colors.white,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white24),
                            ),
                            addVerticalSpace(10) // some extra space for margin
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: constraints.maxWidth,
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      bottom: 10.0,
                      // Not the other sides because of Scrolling
                    ),
                    child: Stack(
                      clipBehavior: Clip
                          .none, // it will shows the menu between green and white container
                      children: [
                        Column(
                          children: [
                            // some margin by estimate
                            // for positioned Scrolling List
                            addVerticalSpace(constraints.maxWidth * 0.35),
                            Row(
                              children: [
                                Text(
                                  "Popular Foods",
                                  style: textTheme.headline5,
                                ),
                                Expanded(child: Center()),
                                Text(
                                  "View All >",
                                  style: textTheme.subtitle2
                                      ?.apply(color: COLOR_ORANGE),
                                ),
                                addHorizontalSpace(10)
                              ],
                            ),
                            addVerticalSpace(10),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              child: Row(
                                children: PRODUCT_DATA
                                    .map((data) => InkWell(
                                          onTap: () {
                                            // Navigate to Product Page
                                          },
                                          child: ProductItem(
                                            productDate: data,
                                            width: constraints.maxWidth * 0.50,
                                          ),
                                        ))
                                    .toList(),
                              ),
                            )
                          ],
                        ),
                        Positioned(
                            top: -constraints.maxWidth * 0.15,
                            child: Container(
                              width: constraints.maxWidth,
                              height: constraints.maxWidth * 0.35,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                children: CATEGORIES
                                    .map((category) => Container(
                                          margin: const EdgeInsets.only(
                                              right: 10.0),
                                          width: constraints.maxWidth * 0.25,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                    "assets/images/${category['image']}"),
                                                addVerticalSpace(10),
                                                Text(
                                                  "${category['name']}",
                                                  style: textTheme.bodyText2
                                                      ?.apply(
                                                          color: COLOR_BLACK),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
