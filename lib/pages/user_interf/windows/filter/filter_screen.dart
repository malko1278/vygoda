
import 'package:flutter/material.dart';
import 'package:vygoda/color/color_constant.dart';

import 'package:vygoda/pages/search/search_view.dart';
import 'package:vygoda/pages/user_interf/windows/filter/page_view/screen_page_view.dart';
import 'package:vygoda/pages/user_interf/windows/filter/scpecific/specific_catalog.dart';

import 'actions/actions_view.dart';
import 'actions/list_actions.dart';
import 'categories/categories.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<FilterScreen> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final interfReseach = const SearchView();

  final titleSpecification = Container(
    alignment: Alignment.topLeft,
    padding: const EdgeInsets.only(left: 6.0, top: 12),
    child: const Text(
      'Спецификации',
      style: TextStyle(
        fontSize: 18,
        color: firstColor,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  final titleInformation = Container(
    alignment: Alignment.topLeft,
    padding: const EdgeInsets.only(left: 6.0, top: 12),
    child: const Text(
      'О доставке',
      style: TextStyle(
        fontSize: 18,
        color: firstColor,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  getAppBar() {
    return AppBar(
      title: Container(
        height: 75,
        width: 100,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/title_catalog.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white.withOpacity(0.0),
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(null,),
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

    final titleAction = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 7.0, top: 12),
          child: const Text(
            'Акции',
            style: TextStyle(
              fontSize: 18,
              color: firstColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            /**
             * Cette Action affiche tous les produits.
             * Filtre pas encore défini...
             */
            _onTapped('Акции');
          },
          child: Container(
            child: const Image(
              image: AssetImage('assets/images/right_arrow.png'),
            ),
            margin: const EdgeInsets.only(right: 35, top: 13),
          ),
        ),
      ],
    );

    final titleNewAction = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 7.0, top: 12),
          child: const Text(
            'Новинки',
            style: TextStyle(
              fontSize: 18,
              color: firstColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            /**
             * Cette Action affiche uniquement les nouveaux produits...
             */
            _onTapped('Новинки');
          },
          child: Container(
            child: const Image(
              image: AssetImage('assets/images/right_arrow.png'),
            ),
            margin: const EdgeInsets.only(right: 35, top: 13),
          ),
        ),
      ],
    );

    final listOtherView = Column(
      children: <Widget>[
        // PageView Navigator Section
        const ScreenPageView(),
        // Categories views Section
        const Categories(),
        // Title of show action
        titleAction,
        // Actions views Section
        const ActionsView(),
        // Title of Affiche Specification
        titleSpecification,
        // Listes of specification option
        const SpecificationCatalog(),
        // Title of Title of show action
        titleNewAction,
        // New actions views Section
        const ActionsView(),
        // Title of Affiche information
        titleInformation,
        // PageView Navigator of information
        const ScreenPageView(),
      ],
    );

    return Scaffold(
      backgroundColor: thirdColor,
      appBar: getAppBar(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            interfReseach,
            Expanded(
              child: SingleChildScrollView(
                child: listOtherView,
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
}