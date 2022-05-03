
import 'package:flutter/material.dart';

import 'package:vygoda/color/color_constant.dart';

import '../../../../tchat_screen.dart';

class ScreenValidPaye extends StatefulWidget {
  const ScreenValidPaye({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<ScreenValidPaye> {

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

  final _iconValidPay = Container(
    width: 150.0,
    height: 150.0,
    margin: const EdgeInsets.only(top: 20.0),
    child: const CircleAvatar(
      backgroundColor: Colors.white,
      child: Icon(
        Icons.done_rounded,
        color: Colors.red,
        size: 100.0,
      ),
    ),
  );

  final _validPrice = Container(
    margin: const EdgeInsets.only(top: 30.0),
    child: const Text(
      '20 850 ₽',
      style: TextStyle(
        color: firstColor,
        fontSize: 25.0,
      ),
    ),
  );

  final _validMessage = Container(
    margin: const EdgeInsets.only(top: 15.0),
    child: const Text(
      'Ваш заказ оформлен',
      style: TextStyle(
        color: firstColor,
        fontSize: 20.0,
      ),
    ),
  );

  final _validViewCheck = Container(
    margin: const EdgeInsets.only(top: 15.0),
    child: GestureDetector(
      onTap: () {
        print('Afficher le chèque');
      },
      child: const Text(
        'Посмотреть чек',
        style: TextStyle(
          color: firstColor,
          fontSize: 16.0,
          decoration: TextDecoration.underline,
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {

    final _buttonView = Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 55.0, right: 55.0, bottom: 50.0),
      child: RaisedButton(
        child: const Text(
          "Вернуться в мену",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: () {
          /*Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context)  =>
                  const TchatScreen()
              )
          );*/
          /**
           * Ferme toutes les pages, jusqu'à la première page du panier
           */
        },
        elevation: 5.0,
        color: secondColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: thirdColor,
      appBar: getAppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.only(left: 5.0, right: 5.0,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _iconValidPay,
                _validPrice,
                _validMessage,
                _validViewCheck,
              ],
            ),
            _buttonView,
          ],
        ),
      ),
    );
  }
}