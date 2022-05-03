
import 'package:flutter/material.dart';

import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/pages/user_interf/windows/clock/pay/screen_valid_paye.dart';

class ConfigPayCarte extends StatefulWidget {
  const ConfigPayCarte({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<ConfigPayCarte> with AutomaticKeepAliveClientMixin {
  var contrlTextField_one;
  var contrlTextField_twoo;
  var contrlTextField_three;
  var contrlTextField_four;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      contrlTextField_one = TextEditingController();
      contrlTextField_twoo = TextEditingController();
      contrlTextField_three = TextEditingController();
      contrlTextField_four = TextEditingController();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    contrlTextField_one = null;
    contrlTextField_twoo = null;
    contrlTextField_three = null;
    contrlTextField_four = null;
  }

  getAppBar() {
    return AppBar(
      title: const Text(
        "Способ оплаты",
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
        onPressed: () => Navigator.pop(context, false),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: firstColor,
          size: 25.0,
        ),
      ),
    );
  }

  final _titlefirstAction = Container(
    alignment: Alignment.bottomLeft,
    margin: const EdgeInsets.only(top: 10),
    child: const Text(
      'Номер карты',
      style: TextStyle(
        color: firstColor,
        fontSize: 14.0,
        fontWeight: FontWeight.w800,
      ),
    ),
  );

  final _titleSecondAction = Container(
    alignment: Alignment.bottomLeft,
    margin: const EdgeInsets.only(top: 20),
    child: const Text(
      'Имя на карте',
      style: TextStyle(
        color: firstColor,
        fontSize: 14.0,
        fontWeight: FontWeight.w800,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final _textFieldOne = Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: TextField(
        controller: contrlTextField_one,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "0000 0000 0000 0000",
        ),
      ),
    );

    final _contentCard = Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 7),
      child: Stack(
        children: <Widget>[
          Positioned(
            child: _textFieldOne,
          ),
          Positioned(
            child: Container(
              width: 22.0,
              height: 16.0,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Image.asset(
                  'assets/images/master_card.png',
                  width: 10.0,
                  height: 10.0,
                ),
            ),
            top: 16.0,
            right: 20.0,
          ),
        ],
      ),
    );

    final _twooRowCart = Container(
      margin: const EdgeInsets.only(top: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: (MediaQuery.of(context).size.width/2)-20,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: TextField(
              controller: contrlTextField_three,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Месяц/Год",
              ),
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width/2)-20,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: TextField(
              controller: contrlTextField_four,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "CVC",
              ),
            ),
          ),
        ],
      ),
    );

    final _textFieldTwoo = Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      margin: const EdgeInsets.only(top: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: TextField(
        controller: contrlTextField_twoo,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          border: InputBorder.none,
          // border: OutlineInputBorder(),
          hintText: "Имя и Фамилия",
        ),
      ),
    );

    final _listAllView = Column(
      children: <Widget>[
        _titlefirstAction,
        _contentCard,
        _twooRowCart,
        _titleSecondAction,
        _textFieldTwoo,
      ],
    );

    final _buttonView = Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 30.0),
      child: RaisedButton(
        child: const Text(
          "Оплатить 35 462₽",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context)  =>
                  const ScreenValidPaye()
              )
          );
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
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.only(left: 15.0, right: 15.0,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _listAllView,
            _buttonView,
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}