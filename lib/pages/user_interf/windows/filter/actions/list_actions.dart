
import 'package:animations/animations.dart';
import 'package:contextmenu/contextmenu.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/data/static_data.dart';
import 'package:vygoda/models/data/product_elt.dart';
import 'package:vygoda/pages/search/search_view.dart';
import 'package:vygoda/pages/user_interf/windows/filter/actions/state_product.dart';

class ListActions extends StatefulWidget {
  final String titleAppBar;
  const ListActions(this.titleAppBar, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return InitState(titleAppBar);
  }
}

class InitState extends State<ListActions> with AutomaticKeepAliveClientMixin {
  String _numTelUser = "";
  int nbreEltLeft = 0;
  var _beginColor, _filterColor;
  String _titleAppBar;
  List<int> itemsDropBtn = [];
  List<FocusedMenuItem> _listFilterLeft = [];
  List<ListTile> _listFilterRight = [];
  List<ProductElt> _listOfProduct = [];
  List<int> listEltValue = List.filled(productList.length, 0);
  List<List> contentDropBtn = List.filled(productList.length, []);

  InitState(this._titleAppBar);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleAppBar = widget.titleAppBar;
    _numTelUser = '+79527566598';
    _beginColor = firstColor;
    _filterColor = firstColor;
    nbreEltLeft = 8;
    /**
     * Récupérer les informations dans la base de données, en fonction
     * du type de produits (En fonction du titre => "titleAppBar")
     */
    for (int i = 0; i < productList.length; i++) {
      listEltValue[i] = productList[i].nbrBasket;
      for (int j = 0; j <= productList[i].quantity; j++) {
        itemsDropBtn.add(j);
      }
      contentDropBtn[i] = itemsDropBtn;
      itemsDropBtn = [];
      if(_titleAppBar == 'Изобранное') {
        /**
         * Prendre tous les produits ajoutés aux favoris de l'utilisateur
         */
        if(productList[i].isLiked == true) {
          _listOfProduct.add(productList[i]);
        }
      } else {
        _listOfProduct.add(productList[i]);
      }
    }
    initLeftMenu();
  }

  FocusedMenuItem _buildMenuLeft(String textView, int index) {
    return FocusedMenuItem(
      onPressed: () {},
      title: Text(
        textView,
        style: const TextStyle(
          fontSize: 12.0,
          color: firstColor,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  ListTile _buildMenuRight(String textView, int index) {
    return ListTile(
      onTap: () {},
      title: Text(
        textView,
        style: const TextStyle(
          fontSize: 12.0,
          color: firstColor,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  initLeftMenu() {
    String valeurText = "";
    for(var i = 0; i < nbreEltLeft; i++) {
      switch(i) {
        case 0:   valeurText = "Сначала дороже";   break;
        case 1:   valeurText = "Сначала дешевле";   break;
        case 2:   valeurText = "Сначала дороже (за ед. \nвложения)";   break;
        case 3:   valeurText = "Сначала дешевле (за \nед. вложения)";   break;
        case 4:   valeurText = "Сначала популярные";   break;
        case 5:   valeurText = "По новизне";   break;
        case 6:   valeurText = "По размеру скидки";   break;
        case 7:   valeurText = "По рейтингу";   break;
      }
      _listFilterLeft.add(_buildMenuLeft(valeurText, i));
    }
  }

  initRightMenu() {
    String valeurText = "";
    for(var i = 0; i < nbreEltLeft; i++) {
      switch(i) {
        case 0:   valeurText = "Сначала дороже";   break;
        case 1:   valeurText = "Сначала дешевле";   break;
        case 2:   valeurText = "Сначала дороже (за ед. \nвложения)";   break;
        case 3:   valeurText = "Сначала дешевле (за \nед. вложения)";   break;
        case 4:   valeurText = "Сначала популярные";   break;
        case 5:   valeurText = "По новизне";   break;
        case 6:   valeurText = "По размеру скидки";   break;
        case 7:   valeurText = "По рейтингу";   break;
      }
      _listFilterRight.add(_buildMenuRight(valeurText, i));
    }
  }

  getAppBar() {
    return AppBar(
      title: Text(
        _titleAppBar,
        style: const TextStyle(
          fontSize: 20,
          color: firstColor,
          fontWeight: FontWeight.w800,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white.withOpacity(0.0),
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          null,
        ),
      ),
    );
  }

  final interfReseach = const SearchView();

  final _borderSearch = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: Colors.white,
  );

  final _borderSearchPlus = const BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8),
      topRight: Radius.circular(8),
    ),
    color: Colors.white,
  );

  _getureActionLeft() {
    setState(() {
      print('Le premier 0');
      if(_titleAppBar == 'Изобранное') {
        if(_filterColor == secondColor) {
          _filterColor = firstColor;
          /**
           * Ferme la vue
           */
        }
        if(_beginColor == firstColor) {
          _beginColor = secondColor;
          /**
           * Ouvre la vue
           */
        }
      } else {
        StaticData.showSnackbar(context, 'You can\'t do this action');
      }
    });
  }

  _getureActionRight() {
    print('Le premier 1');
    if(_titleAppBar == 'Изобранное') {
      if(_beginColor == secondColor) {
        _beginColor = firstColor;
        /**
         * Ferme la vue
         */
      }
      if(_filterColor == firstColor) {
        _filterColor = secondColor;
        /**
         * Ouvre la vue
         */
      }
    } else {
      StaticData.showSnackbar(context, 'You can\'t do this action');
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final nbProduct = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '${_listOfProduct.length} Таваров',
          style: const TextStyle(
            color: firstColor,
            fontSize: 16.0,
          ),
        ),
      ],
    );

    final _filterRight = Container(
      margin: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _getureActionRight();
          });
        },
        child: Image.asset(
          'assets/images/menu_4.png',
          color: firstColor,
        ),
      ),
    );

    final viewAction = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: FocusedMenuHolder(
            blurSize: 2,
            blurBackgroundColor: Colors.transparent,
            menuWidth: MediaQuery.of(context).size.width*0.45,
            openWithTap: true,
            animateMenuItems: true,
            duration: const Duration(milliseconds: 500),
            onPressed: _getureActionLeft,
            // menuOffset: 50,
            menuBoxDecoration: const BoxDecoration(
              color: firstColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            menuItems: _listFilterLeft,
            child: Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left:8.0),
              width: 185.0,
              decoration: _borderSearch,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Сначала новые',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: _beginColor,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      'assets/images/up_down_class.png',
                      color: firstColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: GestureDetector(
            onSecondaryTapDown: (deatails) {
              /*showContextMenu(
                offset: Offset(100.0, 150.0),
                deatails.globalPosition,
                context: context,
                items: _listFilterRight,
                verticalPadding: ,
              ),*/
            },
            child: Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left:8.0),
              width: 185.0,
              decoration: _borderSearch,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Фильтр',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: _filterColor,
                    ),
                  ),
                  _filterRight,
                ],
              ),
            ),
          ),
        ),
      ],
    );

    final listView = Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0.0, left: 4.0, right: 4.0,),
        itemCount: _listOfProduct.length,
        itemBuilder: (context, index) {
          return StateProduct(index, listEltValue[index], contentDropBtn[index], _numTelUser);
        },
      ),
    );

    return Scaffold(
      backgroundColor: thirdColor,
      appBar: getAppBar(),
      body: Column(
        children: <Widget>[
          // titleInterfac,
          interfReseach,
          const SizedBox(
            height: 10.0,
          ),
          nbProduct,
          const SizedBox(
            height: 10.0,
          ),
          viewAction,
          const SizedBox(
            height: 10.0,
          ),
          listView,
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}