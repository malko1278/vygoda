
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/data/static_data.dart';
import 'package:vygoda/models/data/product_elt.dart';

class ItemProductBasket extends StatefulWidget {
  final ProductElt productList;
  const ItemProductBasket(this.productList, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return InitState(productList);
  }
}

class InitState extends State<ItemProductBasket> {
  ProductElt _productList;
  var _nbreProduct;
  InitState(this._productList);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productList = widget.productList;
    _nbreProduct = 0;
  }

  _incrementQuantity() {
    setState(() {
      if(_nbreProduct < 10) {
        _nbreProduct++;
      } else {
        StaticData.showSnackbar(context, "The number is so big");
      }
    });
  }

  _decrementQuantity() {
    setState(() {
      if(_nbreProduct > 0) {
        _nbreProduct--;
      } else {
        StaticData.showSnackbar(context, "Now you can't do this action");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    final date = Container(
      // padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                height: 130.0,
                width: 100.0,
                color: Colors.grey,
                padding: const EdgeInsets.only(
                    top: 4.0,
                    bottom: 10.0,
                    right: 0.0,
                    left: 0.0
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

    return ListTile(
      contentPadding: const EdgeInsets.all(0.0),
      title: SizedBox(
        height: 160.0,
        width: _size.width,
        // color: secondColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 125.0,
                  width: 93.0,
                  color: Colors.grey.shade400,
                  margin: const EdgeInsets.only(top: 10.0, left: 10.0,),
                  //
                ),
                Container(
                  height: 143.0,
                  width: _size.width-120,
                  // color: Colors.grey,
                  margin: const EdgeInsets.only(top: 14.0, left: 7.0,),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  <Widget>[
                          const Text(
                            'Игррушка плюшевая',
                            style: TextStyle(
                              fontSize: 15,
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
                              text: "Цвет:",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 10.0,
                              ),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: "  Синий",
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
                              text: "Размер:",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 10.0,
                              ),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: "  34",
                                  style: TextStyle(
                                    color: firstColor,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 40,
                                child: FlatButton (
                                  child: const Text(
                                    "-",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: firstColor,
                                    ),
                                  ),
                                  onPressed: _decrementQuantity,
                                  // elevation: 5.0,
                                  color: Colors.transparent,

                                  // textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ),
                              ),
                              Text(
                                '$_nbreProduct',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: firstColor,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(
                                width: 40,
                                child: FlatButton (
                                  child: const Text(
                                    "+",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: firstColor,
                                    ),
                                  ),
                                  onPressed: _incrementQuantity,
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text.rich(
                                TextSpan(
                                  text: "Сумма:",
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 15.0,
                                  ),
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: "  399₽",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: firstColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            /*Image(
              alignment: Alignment.bottomCenter,
              image: const AssetImage('assets/images/line_max.png'),
              color: Colors.grey,
              width: _size.width,
            ),*/
          ],
        ),
      ),
      onTap: () {
        final slidable = Slidable.of(context)!;
        final isClosed = slidable.renderingMode == SlidableRenderingMode.none;
        if(isClosed) {
          slidable.open();
        }
      },
    );
  }
}