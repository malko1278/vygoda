
import 'package:flutter/material.dart';

import 'package:vygoda/models/data/product_elt.dart';

import 'item_action.dart';

class ActionsView extends StatefulWidget {
  const ActionsView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<ActionsView> {
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
          children: List.generate(productList.length, (index) {
            return ItemAction(index);
          }),
        ),
      ),
    );
  }
}