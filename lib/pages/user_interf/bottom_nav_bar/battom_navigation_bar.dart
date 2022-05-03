
import 'package:flutter/material.dart';
import 'package:vygoda/models/views/bottom_nav_model.dart';

class NavigationBottomBar extends StatefulWidget {
  final int defaultSelectedIndex;
  // final ValueChanged<int> onChange;
  final Function (int) onChange;
  final List<NavBarModel> listNavBarModel;

  const NavigationBottomBar({
    required this.defaultSelectedIndex,
    required this.onChange,
    required this.listNavBarModel,
    Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<NavigationBottomBar> with AutomaticKeepAliveClientMixin {
  int _selectedIndex = 0;
  List<NavBarModel> _listModelNavBar = [];
  // late ValueChanged<int> _onChange;
  late Function (int) _onChange;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.defaultSelectedIndex;
    _listModelNavBar = widget.listNavBarModel;
    _onChange = widget.onChange;
  }

  Color? _couleur(int index) {
    var couler;
    if(index == _selectedIndex) {
      if((index >= 0) && (index <= 3))  couler = Colors.blue;
    }
    return couler;
  }

  Widget _buildNavBarItem(NavBarModel navBarModel, int index, int tail) {
    return GestureDetector(
      onTap: () {
        _selectedIndex = index;
        _onChange(index);
      },
      child: SizedBox(
        height: 50.0,
        width: MediaQuery.of(context).size.width/tail,
        child: Image(
          image: AssetImage(navBarModel.icon),
          color: _couleur(index),
        ),
      ),
    );
  }

  Widget getFooter() {
    List<Widget> _navBarItemList = [];
    for(var i = 0; i < _listModelNavBar.length; i++) {
      _navBarItemList.add(_buildNavBarItem(_listModelNavBar[i], i, _listModelNavBar.length));
    }
    Widget row = Row(
      children: _navBarItemList,
    );
    return row;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return getFooter();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}