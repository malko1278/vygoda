
import 'package:flutter/material.dart';

import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/models/data/product_elt.dart';
import 'package:vygoda/models/users/user.dart';

class StateProduct extends StatefulWidget {
  final int index;
  final int listEltValue;
  final String numTelUser;
  final List contentDropBtn;

  const StateProduct(
    this.index,
    this.listEltValue,
    this.contentDropBtn,
    this.numTelUser,
    {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return InitState(index, listEltValue, contentDropBtn, numTelUser);
  }
}

class InitState extends State<StateProduct> {
  int _index;
  int _listEltValue;
  String _numTelUser;
  List _contentDropBtn;
  var _colorFavorite;
  var _colorBasket;
  var _colorSpecific;

  InitState(this._index, this._listEltValue, this._contentDropBtn, this._numTelUser);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _index = widget.index;
    _numTelUser = widget.numTelUser;
    _listEltValue = widget.listEltValue;
    _contentDropBtn = widget.contentDropBtn;
    _colorFavorite = _changeColorLike();
    _colorBasket = _changeColorIsInBasket();
    _colorSpecific = _changeColorIsInSpecification();
  }

  User getUser(String telUser) {
    var user = userList[0];
    for (int i = 0; i < userList.length; i++) {
      if(userList[i].numTel == telUser) {
        user = userList[i];
      }
    }
    return user;
  }

  Color _changeColor(bool valeur) {
    if(valeur == true) {
      return Colors.red;
    }
    return Colors.grey;
  }

  bool _productExist() {
    User _userConnect = getUser(_numTelUser);
    for(int i = 0; i < _userConnect.favorites.length; i++) {
      if(_userConnect.favorites[i] == productList[_index].idProduct) {
        return true;
      }
    }
    return false;
  }

  bool _productIsSelected() {
    User _userConnect = getUser(_numTelUser);
    for(int i = 0; i < _userConnect.myBasket.length; i++) {
      if(_userConnect.myBasket[i] == productList[_index].idProduct) {
        return true;
      }
    }
    return false;
  }

  Color _changeColorLike() {
    var couleur;
    bool isliked = _productExist();
    setState(() {
      couleur = _changeColor(isliked);
    });
    return couleur;
  }

  Color _changeColorIsInSpecification() {
    var couleur = Colors.grey;
    /*var couleur;
    bool isliked = _productIsSelected(index);
    setState(() {
      couleur = _couleur(isliked);
    });*/
    return couleur;
  }

  Color _changeColorIsInBasket() {
    var couleur;
    bool isPresent = _productIsSelected();
    setState(() {
      couleur = _changeColor(isPresent);
    });
    return couleur;
  }

  void _onTappedAction(int posit) {
    if(posit == 1) {
      /**
       * Action qui ajoute le produit dans les favories de l'utilisateur
       * Action qui retire le produit des favories de l'utilisateur
       */
      setState(() {
        if(_colorFavorite == Colors.red) {
          _colorFavorite = _changeColor(false);
        } else {
          if(_colorFavorite == Colors.grey) {
            _colorFavorite = _changeColor(true);
          }
        }
      });
    } else {
      if(posit == 2) {
        /**
         * Action qui ajoute le produit dans une spécification de l'utilisateur
         * Action qui retire le produit d'une spécification de l'utilisateur
         */
        setState(() {
          if(_colorSpecific == Colors.red) {
            _colorSpecific = _changeColor(false);
          } else {
            if(_colorSpecific == Colors.grey) {
              _colorSpecific = _changeColor(true);
            }
          }
        });
      } else {
        if(posit == 3) {
          /**
           * Action qui ajoute (_listEltValue) produit(s) dans le panier de l'utilisateur
           * Action qui retire (_listEltValue) produit(s) du panier de l'utilisateur
           */
          setState(() {
            if(_colorBasket == Colors.red) {
              _colorBasket = _changeColor(false);
            } else {
              if(_colorBasket == Colors.grey) {
                _colorBasket = _changeColor(true);
              }
            }
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
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
              Container(
                height: 125.0,
                width: _size.width-214.0,
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      productList[_index].massagAffich,
                      style: const TextStyle(
                        fontSize: 16,
                        color: firstColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:2.0),
                      child: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20.0,
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20.0,
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20.0,
                          ),
                          const Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                            size: 20.0,
                          ),
                          const Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                            size: 20.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              '(${productList[_index].nbrLike})',
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:5.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '${productList[_index].prixNow}',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.red,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 5.0,),
                            child: Text(
                              '/шт',
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,),
                            child: Text(
                              '${productList[_index].lastPrix}',
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, bottom:0.0),
                      child: Container(
                        width: 80,
                        height: 35.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                          // border: Border.all(color: Colors.deepOrange, width: 4),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<int>(
                            value: _listEltValue, // currently selected item
                            items: _contentDropBtn.map((item) => DropdownMenuItem<int>(
                              child: Container(
                                padding: const EdgeInsets.only(left: 6,),
                                child: Text(
                                  '$item шт',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              value: item,
                            )).toList(),
                            onChanged: (value) => setState(() {
                              if(value != null) {
                                _listEltValue = value;
                              } else {
                                _listEltValue = 0;
                              }
                            }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 130.0,
                width: 90.0,
                alignment: Alignment.topRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _onTappedAction(1);
                            });
                          },
                          child: Image(
                            image: const AssetImage('assets/images/like_max.png'),
                            color: _colorFavorite, // Colors.grey,   // Peut changer
                            height: 40.0,
                            width: 50.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _onTappedAction(2);
                          },
                          child: Image(
                            image: const AssetImage('assets/images/imag_dossier.png'),
                            color: _colorSpecific,
                            height: 27.0,
                            width: 37.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(),
                        Container(
                          margin: const EdgeInsets.only(right: 3.0, bottom: 2.0),
                          child: GestureDetector(
                            onTap: () {
                              _onTappedAction(3);
                            },
                            child: Image(
                              image: const AssetImage('assets/images/basket.png'),
                              color: _colorBasket,
                              height: 49.0,
                              width: 59.0,
                              alignment: Alignment.bottomRight,
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
          Padding(
            padding: const EdgeInsets.only(top: 15.0,),
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