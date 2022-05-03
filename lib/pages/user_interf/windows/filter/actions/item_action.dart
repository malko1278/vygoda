
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:vygoda/pages/user_interf/windows/filter/actions/product/item_product.dart';

class ItemAction extends StatelessWidget {
  final int index;
  const ItemAction(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 145,
      margin: const EdgeInsets.only(left: 6, top: 0.0,),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
      ),
      child: ItemProduct(index),
    );
  }
}