
import 'package:flutter/material.dart';

import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/pages/user_interf/windows/filter/catalog/select_category.dart';

class NameSpecification extends StatefulWidget {
  const NameSpecification({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<NameSpecification> {

  final _titleNameSpecif = const Text(
    "Название спецификации",
    style: TextStyle(
      color: firstColor,
      fontSize: 20.0,
      fontWeight: FontWeight.w800,
    ),
  );

  final _titleDeclSpecif_0 = const Padding(
    padding: EdgeInsets.only(top: 50),
    child: Text(
      "Спецификации пуста",
      style: TextStyle(
        color: Colors.grey,
        fontSize: 15.0,
        // fontWeight: FontWeight.w800,
      ),
    ),
  );

  final _titleDeclSpecif_1 = const Padding(
    padding: EdgeInsets.only(top: 4),
    child: Text(
      "Добавьте товары",
      style: TextStyle(
        color: Colors.grey,
        fontSize: 15.0,
        // fontWeight: FontWeight.w800,
      ),
    ),
  );

  getAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white.withOpacity(0.0),
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          null,
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(null),
            icon: const Icon(
              Icons.close,
              color: Colors.grey,
              size: 40.0,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    final _buttonView = SizedBox(
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        child: const Text(
          "Дабавить товары",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: () {
          /**
           * Il est possible que l'action ci-dessous doive fermer cette interface
           */
          Navigator.push(context, MaterialPageRoute(builder: (context)  => const SelectCategory()));
        },
        elevation: 5.0,
        color: secondColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          // side: const BorderSide(color: Colors.red)
        ),
      ),
    );

    return Scaffold(
      backgroundColor: thirdColor,
      appBar: getAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _titleNameSpecif,
                    _titleDeclSpecif_0,
                    _titleDeclSpecif_1,
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 373.0, right: 50.0, left: 50.0,),
                child: _buttonView,
              ),
            ],
          ),
        ),
      ),
    );
  }
}