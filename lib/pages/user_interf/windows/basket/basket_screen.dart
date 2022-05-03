
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/data/static_data.dart';
import 'package:vygoda/models/data/product_elt.dart';
import 'package:vygoda/models/views/slidable_action.dart';
import 'package:vygoda/pages/user_interf/windows/clock/command/decoration_screen.dart';
import 'package:vygoda/pages/user_interf/windows/filter/actions/product/item_product_basket.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<BasketScreen> with AutomaticKeepAliveClientMixin {
  var valSelected;
  var adressController;
  var promoCodController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    valSelected = 0;
    adressController = TextEditingController();
    promoCodController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    adressController = null;
    promoCodController = null;
  }

  Widget _getObjetSlidable(int posit) {
    return Slidable(
      actionPane: const SlidableStrechActionPane(),
      actionExtentRatio: 0.2,

      child: ItemProductBasket(productList[posit]),
      // right.slider,
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'В корзина',
          foregroundColor: Colors.white,
          color: Colors.red,
          iconWidget: Image.asset(
            'assets/images/trash_bin.png',
            color: Colors.white,
          ),
          onTap: () => onDismissed(posit, SlidableAction.basket),
        ),
        IconSlideAction(
          caption: 'В избранное',
          foregroundColor: Colors.white,
          color: secondColor,
          iconWidget: Image.asset(
            'assets/images/like_3.png',
            color: Colors.white,
          ),
          onTap: () => onDismissed(posit, SlidableAction.like),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Size _size = MediaQuery.of(context).size;

    final _getAppBar = Container(
      height: 75,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 23,),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 5.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo_vygoda.png',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
            width: _size.width-205,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  "Моя корзина",
                  style: TextStyle(
                    fontSize: 20,
                    color: firstColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            width: 90,
            margin: const EdgeInsets.only(right: 10.0,),
          ),
        ],
      ),
    );

    final _enterAdressClient = Container(
      height: 50.0,
      width: _size.width,
      // color: Colors.blue,
      margin: const EdgeInsets.only(left: 10.0, top: 0.0, right: 10.0, bottom: 10.0,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            width: _size.width/3,
            // color: Colors.yellow,
            margin: const EdgeInsets.only(bottom: 7.0,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Введите адрес:",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 2*(_size.width/3)-20,
            // color: Colors.grey.shade600,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40.0,
                  child: TextField(
                    // autofocus: true,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontSize: 18,
                      color: firstColor,
                    ),
                    controller: adressController,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    final _spaceToBuy = Container(
      width: 300.0,
      height: 185.0,
      // color: Colors.grey.shade300,
      margin: const EdgeInsets.only(top: 15.0, bottom: 20.0, left: 20.0, right: 20.0,),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 30.0,
            margin: const EdgeInsets.only(top: 10.0,),
            child: Image.asset('assets/images/badge.png'),
          ),
          Container(
            width: 266.0,
            margin: const EdgeInsets.only(left: 4.0,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        const Text(
                          'Промокод',
                          style: TextStyle(
                            fontSize: 14,
                            color: firstColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            SizedBox(
                              width: 145.0,
                              height: 30.0,
                              child: TextField(
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: firstColor,
                                ),
                                controller: promoCodController,
                              ),
                            ),
                            SizedBox(
                              height: 35.0,
                              width: 35.0,
                              child: Stack(
                                children: <Widget>[
                                  const Positioned(
                                    top: 12.5,
                                    left: 12.5,
                                    child: Icon(
                                      Icons.clear,
                                      size: 20.0,
                                      color: Colors.red,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        // usualColor = myColor;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.circle,
                                      color: Colors.grey.shade300,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Выставить счет на почту',
                          style: TextStyle(
                            fontSize: 14,
                            color: firstColor,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                          child: Radio(
                            value: 1,
                            groupValue: valSelected,
                            activeColor: Colors.grey,
                            onChanged: (value) {
                              setState(() {
                                valSelected = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          'Итоговая цена:',
                          style: TextStyle(
                            fontSize: 16,
                            color: firstColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          '798 ₽',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: 266.0,
                      height: 45.0,
                      child: FlatButton (   // RaisedButton
                        child: const Text(
                          "Оформить заказ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ScreeDecoration()
                              ),
                            );
                          });
                        },
                        // elevation: 5.0,
                        color: Colors.black12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

    List<Widget> _listObjectInBasket = [];
    for(var i = 0; i < 6; i++) {
      _listObjectInBasket.add(_getObjetSlidable(i));
    }
    _listObjectInBasket.add(_spaceToBuy);

    final _listAllWidget = Column(
      children: _listObjectInBasket,
    );

    return Scaffold(
      backgroundColor: thirdColor,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            _getAppBar,
            _enterAdressClient,
            Expanded(
              child: SingleChildScrollView(
                child: _listAllWidget,
                physics: const ClampingScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  onDismissed(int index, SlidableAction action) {
    String message = "";
    switch (action) {
      case SlidableAction.like:
        setState(() {
          /**
           * Action permettant de liker un produit, avec changement de couleur
           * liker le produit dans le panier, situé à la position i
           */
        });
        message = "message";
        break;
      case SlidableAction.basket:
        setState(() {
          /**
           * Action permettant d'ajouter un produit dans le panier, avec changement de couleur
           * liker le produit dans le panier, situé à la position i
           */
        });
        message = "message";
        break;
    }
    StaticData.showSnackbar(context, message);
  }
}

class Utils {
}