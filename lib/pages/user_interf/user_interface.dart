
import 'package:flutter/material.dart';

import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/models/views/bottom_nav_model.dart';
import 'package:vygoda/pages/user_interf/windows/like/liker_screen.dart';
import 'package:vygoda/pages/user_interf/windows/clock/history_screen.dart';
import 'package:vygoda/pages/user_interf/windows/basket/basket_screen.dart';
import 'package:vygoda/pages/user_interf/windows/filter/filter_screen.dart';
import 'package:vygoda/pages/user_interf/windows/profil/profil_screen.dart';

import 'navigation/tab_navigator.dart';
import 'bottom_nav_bar/battom_navigation_bar.dart';

class UserInterface extends StatefulWidget {
  const UserInterface({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<UserInterface> with AutomaticKeepAliveClientMixin {
  late int _selectItem;
  late List<Widget> _pagesCatalog;
  var _navigatorKey;

  @override
  void initState() {
    super.initState();
    _selectItem = 0;
    _pagesCatalog = <Widget>[
      const FilterScreen(),
      const LikerScreen(),
      const BasketScreen(),
      const HistoryScreen(),
      const ProfilScreen(),
    ];
    _navigatorKey = {
      listNavBarMod[0].title: GlobalKey<NavigatorState>(),
      listNavBarMod[1].title: GlobalKey<NavigatorState>(),
      listNavBarMod[2].title: GlobalKey<NavigatorState>(),
      listNavBarMod[3].title: GlobalKey<NavigatorState>(),
      listNavBarMod[4].title: GlobalKey<NavigatorState>(),
    };
  }

  @override
  void dispose() {
    super.dispose();
    _selectItem = 0;
    // _pagesCatalog = null;
    _navigatorKey = null;
  }

  void _selectTab(int index) {
    setState(() {
      _selectItem = index;
      // currentPage = listNavBarMod[_selectItem].title;
    });
  }

  getBody() {
    List<Widget> _navListPage = [];
    for(var i = 0; i < listNavBarMod.length; i++) {
      _navListPage.add(_buildOffstageNavigator(listNavBarMod[i].title, i));
    }
    return Stack(
      children: _navListPage,
    );
  }

  Widget _buildOffstageNavigator(String title, int index) {
    return Offstage(
      offstage: listNavBarMod[_selectItem].title != title, // currentPage
      // offstage: currentPage != title,
      child: TabNavigator(
        currentPosition: index,
        listWidgets: _pagesCatalog,
        navigatorKey: _navigatorKey[title],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: () async =>
          !await _navigatorKey[listNavBarMod[_selectItem].title].currentState.maybePop(),
      child: Scaffold(
        backgroundColor: thirdColor,
        body: getBody(),
        bottomNavigationBar: NavigationBottomBar(
          listNavBarModel: listNavBarMod,
          onChange: _selectTab,
          defaultSelectedIndex: _selectItem,
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}