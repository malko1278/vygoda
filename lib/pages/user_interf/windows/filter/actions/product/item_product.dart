
import 'package:flutter/material.dart';

import 'package:vygoda/models/data/product_elt.dart';
import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/pages/user_interf/windows/filter/actions/product/product_screen.dart';

class ItemProduct extends StatefulWidget {
  final int index;
  const ItemProduct(this.index, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return InitState(index);
  }
}

class InitState extends State<ItemProduct> {
  int index;

  Color _couleur(bool valeur) {
    if(valeur == true) {
      return Colors.blue;
    }
    return Colors.grey;
  }

  void _addLikeProduct() {
    setState(() {
      if(productList[index].isLiked) {
        productList[index].isLiked = false;
      } else {
        productList[index].isLiked = true;
      }
      _couleur(productList[index].isLiked);
      /**
       * Actions d'ajout du like de ce produit
       * ou du retrait du like de ce produit
       */
    });
  }

  InitState(this.index);

  void _addToBasket() {
    /**
     * Action for add the product in the basket
     */
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        SizedBox(
          height: 30.0,
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                onPressed: _addLikeProduct,
                icon: Icon(
                  Icons.favorite_border,
                  color: _couleur(productList[index].isLiked),
                  size: 20.0,
                ),
                alignment: Alignment.topRight,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              productList[index].imagArticle,
              height: 50.0,
              width: 90.0,
            ),
          ],
        ),
        Text(
          productList[index].massagAffich,
          style: const TextStyle(
            fontSize: 10,
            color: firstColor,
          ),
        ),
        Text(
          '${productList[index].prixAffich} ₽/шт',  // '328.90 ₽/шт',
          style: const TextStyle(
            fontSize: 10,
            color: firstColor,
          ),
        ),
        Container(
          height: 30.0,
          width: double.maxFinite,
          margin: const EdgeInsets.only(top: 5,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: _addToBasket,
                child: Container(
                  child: const Icon(
                    Icons.add_circle_outline,
                    color: Colors.grey,
                    size: 25.0,
                  ),
                  margin: const EdgeInsets.only(left: 35),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)  => ProductScreen(index)));
                },
                child: Container(
                  child: const Icon(
                    Icons.arrow_forward,
                    color: secondColor,
                    size: 25.0,
                  ),
                  margin: const EdgeInsets.only(top: 3, left: 18),
                  alignment: Alignment.topRight,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}