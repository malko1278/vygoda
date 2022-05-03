
import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  // final NavBarModel navBarModel;
  final int currentPosition;
  final List<Widget> listWidgets;
  final GlobalKey<NavigatorState> navigatorKey;

  const TabNavigator({
    Key? key,
    required this.listWidgets,
    required this.navigatorKey,
    required this.currentPosition}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget child = listWidgets[currentPosition];

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}