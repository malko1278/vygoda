
import 'package:flutter/material.dart';

import 'package:vygoda/models/data/category.dart';

import 'category_item.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<Categories> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 15),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: FittedBox(
        fit: BoxFit.fill,
        alignment: Alignment.topCenter,
        child: Row(
          children: List.generate(categoryList.length, (index) {
            return CategoryItem(index);
          }),
        ),
      ),
    );
  }
}