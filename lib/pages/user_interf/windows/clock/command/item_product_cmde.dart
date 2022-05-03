
import 'package:flutter/material.dart';
import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/models/data/product_elt.dart';

class ItemProductCmdeState extends StatefulWidget {
  final String idProduct;

  const ItemProductCmdeState(
      this.idProduct,
      {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return InitState(idProduct);
  }
}

class InitState extends State<ItemProductCmdeState> {
  String _idProduct;
  var _produit;

  InitState(this._idProduct);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _idProduct = widget.idProduct;
    _produit = _getProductID();
  }

  ProductElt _getProductID() {
    var produit;
    /**
     * Action permettant de retourner un produit à partir de son nom
     */
    for (var i = 0; i < productList.length; i++) {
      if(productList[i].idProduct == _idProduct) {
        produit = productList[i];
      }
    }
    return produit;
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                height: 140.0,
                width: 100.0,
                color: Colors.grey,
                padding: const EdgeInsets.only(
                    bottom: 10.0,
                    right: 0.0,
                    left: 0.0
                ),
              ),
              Container(
                height: 125.0,
                margin: const EdgeInsets.only(left: 20.0,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  <Widget>[
                    const Text(
                      'Игррушка плюшевая',
                      style: TextStyle(
                        fontSize: 16,
                        color: firstColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Производитель',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Text(
                      'Код производства: 102191',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Цена:",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 10.0,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                            text: "  57₽",
                            style: TextStyle(
                              color: secondColor,
                              fontSize: 14.0,
                            ),
                          ),
                          TextSpan(
                            text: "/шт",
                            style: TextStyle(
                              color: secondColor,
                              fontSize: 10.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Кол-во:",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 10.0,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                            text: "  7 шт",
                            style: TextStyle(
                              color: firstColor,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Сумма:",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 10.0,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                            text: "  399₽",
                            style: TextStyle(
                              color: firstColor,
                              fontSize: 13.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0,),
            child: Image(
              alignment: Alignment.bottomCenter,
              image: const AssetImage('assets/images/line.png'),
              color: Colors.grey,
              width: _size.width,
            ),
          ),
        ],
      ),
    );
  }
}