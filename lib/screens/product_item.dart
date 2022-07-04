import 'package:flutter/material.dart';
import 'package:food_app/utils/constants.dart';
import 'package:food_app/utils/widget_functions.dart';

class ProductItem extends StatelessWidget {
  final Map<String, dynamic> productDate;
  final double width;

  const ProductItem(
      {super.key, required this.productDate, required this.width});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final height = width * 4 / 3;
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: width,
      height: height + 40,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(flex: 2, child: Container()),
              Expanded(
                  flex: 7,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/${productDate['image']}",
                    width: width * 0.80,
                  ),
                ),
                Expanded(child: Center()),
                Text(
                  "${productDate['name']}",
                  style: textTheme.headline6,
                ),
                addVerticalSpace(5),
                RichText(
                    text: TextSpan(children: [
                  WidgetSpan(
                      child: Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 15,
                  )),
                  TextSpan(
                      text: "${productDate['rest']}", style: textTheme.caption)
                ])),
                addVerticalSpace(15),
                Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: RichText(
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.star,
                                color: COLOR_ORANGE,
                                size: 15,
                              )),
                              TextSpan(
                                  text: "${productDate['rating']}",
                                  style: textTheme.subtitle2
                                      ?.apply(fontWeightDelta: 4))
                            ]))),
                    Expanded(
                        flex: 5,
                        child: RichText(
                            textAlign: TextAlign.right,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "\$",
                                  style: textTheme.subtitle2
                                      ?.apply(fontWeightDelta: 4)),
                              TextSpan(
                                  text: "${productDate['price']}",
                                  style: textTheme.headline5
                                      ?.apply(color: COLOR_ORANGE)),
                            ])))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
