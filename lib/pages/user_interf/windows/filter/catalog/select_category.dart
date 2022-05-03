
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/models/data/categ_product.dart';
import 'package:vygoda/pages/search/search_view.dart';
import 'package:vygoda/pages/user_interf/windows/filter/actions/list_actions.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SelectCategory> with AutomaticKeepAliveClientMixin {
  int _selectIndex = 0;
  Color colorList = Colors.grey;
  Color colorGril = Colors.blue;
  var interfaceProduct = Expanded(child: Container(),);
  var staggeredGridView = Expanded(child: Container(),);
  /*final PageController _pageController = PageController();
  final List<Widget> _pagesCatalog = <Widget>[
    const ListViewProduct(),
    const StaggeredGridViewProduct(),
  ];
  List<Widget> _navBarItemList = [];*/
  final List<String> _imagList = <String>[
    'assets/images/menu_2.png',
    'assets/images/menu_3.png',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      // int elt = 0;
      staggeredGridView = Expanded(
        child: StaggeredGridView.countBuilder(
          padding: const EdgeInsets.only(top: 2.0, left: 3.0, right: 3.0, bottom: 2.0),
          mainAxisSpacing: 3,
          crossAxisCount: 4,
          // staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
          // staggeredTileBuilder: (index) => index % 3 == 0 ? const StaggeredTile.count(2, 2) : const StaggeredTile.count(1, 2),
          // staggeredTileBuilder: (index) => const StaggeredTile.count(2, 2),
          staggeredTileBuilder: (index) => StaggeredTile.count(2, index.isEven ? 2 : 1),
          itemCount: 14,
          itemBuilder: (context, index) => _buildCardProduct(index, index.isEven),
        ),
      );
      _onPageChanged(_selectIndex, staggeredGridView);
    });
  }

  Widget _buildCardProduct(int index, bool valBool) => GestureDetector(
    onTap: () {
      _onTapped(categPordList[index].label);
    },
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                categPordList[index].label,
                style: TextStyle(
                  fontSize: valBool == true ? 18 : 15,
                  color: firstColor,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: valBool == true ? const EdgeInsets.all(5.0) : const EdgeInsets.all(3.0),
                child: Image(
                  image: AssetImage(categPordList[index].imageUrl),
                  height: valBool == true ? 110.0 : 35.0,
                  width: valBool == true ? 110.0 : 35.0,
                  alignment: Alignment.bottomRight,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  void _onPageChanged(int index, Expanded expandeValue) {
    if(index == 0) {
      colorList = Colors.grey;
      colorGril = Colors.blue;
    } else {
      if(index == 1) {
        colorList = Colors.blue;
        colorGril = Colors.grey;
      }
    }
    interfaceProduct = expandeValue;
  }

  final interfReseach = const SearchView();

  getAppBar() {
    return AppBar(
      title: const Text(
        "Выбрать категорию",
        style: TextStyle(
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

  void _onTapped(String titleAppBar) {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context)  => ListActions(titleAppBar)));
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final listView = Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0.0,),
        itemCount: 14,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _onTapped(categPordList[index].label);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 0.0,
                    bottom: 0.0,
                    right: 7.0,
                    left: 7.0
                ),
                child: SizedBox(
                  height: 70.0,
                  // width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 7.0,),
                        child: Text(
                          categPordList[index].label,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF001c4c),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 3.0),
                        child: Image.asset(
                          categPordList[index].imageUrl,
                          height: 60.0,
                          width: 60.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );

    final iconesListProduit = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              print('Le premier 0');
              _onPageChanged(0, staggeredGridView);
            });
          },
          child: SizedBox(
            height: 50.0,
            width: 50.0,
            child: Image(
              image: AssetImage(_imagList[0]),
              color: colorGril,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              print('Le premier 1');
              _onPageChanged(1, listView);
              // listView
            });
          },
          child: SizedBox(
            height: 50.0,
            width: 50.0,
            child: Image(
              image: AssetImage(_imagList[1]),
              color: colorList,
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: thirdColor,
      appBar: getAppBar(),
      body: Column(
        children: <Widget>[
          interfReseach,
          iconesListProduit,
          interfaceProduct,
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}