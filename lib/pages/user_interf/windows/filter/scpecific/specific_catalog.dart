
import 'package:flutter/material.dart';

import 'package:vygoda/models/data/specification.dart';

import 'item_specification.dart';

class SpecificationCatalog extends StatefulWidget {
  const SpecificationCatalog({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SpecificationCatalog> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 15),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: FittedBox(
        fit: BoxFit.fill,
        alignment: Alignment.topCenter,
        child: Row(
          children: List.generate(specificList.length, (index) {
            return ItemSpecification(index);
          }),
        ),
      ),
    );
  }
}