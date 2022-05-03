
import 'package:flutter/material.dart';

import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/pages/connect/add_details.dart';
import 'package:vygoda/pages/user_interf/user_interface.dart';

class SelectTypeUser extends StatefulWidget {
  const SelectTypeUser({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SelectTypeUser> {
  var btnjuristColor = Colors.transparent; // Colors.redAccent
  var btnphysikColor = Colors.transparent; // Colors.redAccent

  void _changeFirstButton() {
    setState(() {
      if(btnjuristColor == Colors.transparent) {
        btnjuristColor = Colors.redAccent;
        btnphysikColor = Colors.transparent;
      }
    });
  }

  void _changeSecondButton() {
    setState(() {
      if(btnphysikColor == Colors.transparent) {
        btnphysikColor = Colors.redAccent;
        btnjuristColor = Colors.transparent;
      }
    });
  }

  void _selectUser() {
    setState(() {
      if(btnjuristColor == Colors.redAccent) {
        Navigator.push(context, MaterialPageRoute(builder: (context)  => const addDetails()));
      } else {
        if(btnphysikColor == Colors.redAccent) {
          Navigator.push(context, MaterialPageRoute(builder: (context)  => const UserInterface()));
        }
      }
    });
  }

  final _titleType_usr = Container (
    margin: const EdgeInsets.only(top: 80, left: 25.0,),
    child: const Text(
      "Выберите, как \nпланируете заказывать",
      style: TextStyle(
        color: Colors.white,
        fontSize: 28.0,
        fontWeight: FontWeight.w800,
      ),
    ),
  );

  final _titleNote = Container(
    margin: const EdgeInsets.only(top: 40, left: 25.0, right: 25),
    child: const Text.rich(
      TextSpan(
        text: "Нажав кнопку \"Вперед\", вы подтверждаете, что\nознакомились с ",
        style: TextStyle(
          color: Colors.white,
          fontSize: 13.0,
        ),
        children: <TextSpan>[
          TextSpan(
            text: "соглашением на обработку\nперсональных данных",
            style: TextStyle(
              color: secondColor,
              fontSize: 13.0,
            ),
          ),
          TextSpan(
            text: " и принимаете его условия.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13.0,
            ),
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {

    final _btnJuriste = Container(
      margin: const EdgeInsets.only(top: 30, left: 25.0, right: 25),
      height: 110.0,
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        onPressed: _changeFirstButton,
        color: Colors.white,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: btnjuristColor,
            width: 2.0,
          ),
        ),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 15.0, bottom: 30.0,),
              child: Text(
                'Как юрлицо',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF001c4c),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 1.0),
              child: Image.asset(
                'assets/images/usr_jurist.png',
                height: 85.0,
                width: 110.0,
              ),
            ),
          ],
        ),
      ),
    );

    final _btnPhysik = Container(
      margin: const EdgeInsets.only(top: 15, left: 25.0, right: 25),
      height: 110.0,
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        onPressed: _changeSecondButton,
        color: Colors.white,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: btnphysikColor,
            width: 2.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 15.0, bottom: 30.0,),
              child: Text(
                'Как физлицо',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: firstColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 1.0),
              child: Image.asset(
                'assets/images/usr_physik.png',
                height: 85.0,
                width: 110.0,
              ),
            ),
          ],
        ),
      ),
    );

    final _btnConnect = ClipRRect(
      child: Container(
        height: 65,
        width: 45,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/connect.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: FlatButton(
          highlightColor: secondColor,
          onPressed: _selectUser,
          padding: const EdgeInsets.all(0.0),
          child: Image.asset('assets/images/connect.png'),
        ),
      ),
    );

    final _contentWidget = SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _titleType_usr,
          _btnJuriste,
          _btnPhysik,
          _titleNote,
        ],
      ),
    );

    return Scaffold(
      backgroundColor: firstColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _contentWidget,
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 112, right: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    _btnConnect,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
