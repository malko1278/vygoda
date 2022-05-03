
import 'package:flutter/material.dart';

import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/pages/user_interf/windows/clock/pay/screen_valid_paye.dart';

import 'config_pay_carte.dart';

class ConfigCommandScreen extends StatefulWidget {
  const ConfigCommandScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<ConfigCommandScreen> with AutomaticKeepAliveClientMixin {
  var contrlTextField_one;
  var contrlTextField_twoo;
  var contrlTextField_three;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      contrlTextField_one = TextEditingController();
      contrlTextField_twoo = TextEditingController();
      contrlTextField_three = TextEditingController();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    contrlTextField_one = null;
    contrlTextField_twoo = null;
    contrlTextField_three = null;
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
      'Данные компании',
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
      margin: const EdgeInsets.only(top: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
      child: TextField(
        controller: contrlTextField_one,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: "*Email:",
        ),
      ),
    );

    final _textFieldTwoo = Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      margin: const EdgeInsets.only(top: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        controller: contrlTextField_twoo,
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: "*ИНН:",
        ),
      ),
    );

    final _textFieldThree = Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      margin: const EdgeInsets.only(top: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        controller: contrlTextField_three,
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: "*КПП:",
        ),
      ),
    );

    final _listAllView = Column(
      children: <Widget>[
        _titlefirstAction,
        _textFieldTwoo,
        _textFieldOne,
        _textFieldThree,
      ],
    );

    final _buttonView = Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 30.0),
      child: RaisedButton(
        child: const Text(
          "Подтвердить заказ",
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
                  const ConfigPayCarte()
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
          // crossAxisAlignment: CrossAxisAlignment.center,
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