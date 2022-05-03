
import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/pages/connect/select_typ_user.dart';

class SendCode extends StatefulWidget {
  const SendCode({Key? key}) : super(key: key);
  // static const routeName = '/code_sms';

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SendCode> {
  var _currentPosition = 0;
  final _digits = List.filled(4, "");
  Timer? _timer;
  int _counter = 0;
  bool _timeout = false;
  bool codExist = false;
  bool _compte = false;

  static const int MAX_DURATION = 30;

  void _initTimer() {
    setState(() {
      _timeout = false;
      _counter = MAX_DURATION;
    });
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
        setState(() {
          if (_counter == 0) {
            timer.cancel();
            _timeout = true;
          } else {
             _counter--;
          }
        });
      },
    );
  }

  final _titleKodSms_First = Container(
    // margin: const EdgeInsets.only(top: 40,),
    margin: const EdgeInsets.only(top: 80, left: 25.0, right: 25),
    child: const Text(
      "Код подтвеждения",
      style: TextStyle(
        color: Colors.white,
        fontSize: 30.0,
        fontWeight: FontWeight.w800,
      ),
    ),
  );

  final _titleKodSms_Second = Container(
    margin: const EdgeInsets.only(top: 30, left: 25.0, right: 25),
    child: const Text(
      "Введите код из смс-сообщения",
      style: TextStyle(
        color: Colors.white,
        fontSize: 17.0,
        // fontWeight: FontWeight.w800,
      ),
    ),
  );

  Widget _buildKeyboard() {
    List<Widget> _keys = List.generate(4, (i) => Expanded(
      child: Row(
        children: List.generate(3, (j) {
          var index = i * 3 + j;
          if (index == 11) {
            return Expanded(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  enableFeedback: true,
                  child: const Center(
                    child: Icon(
                      Icons.backspace,
                      color: secondColor,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      if (_currentPosition > 0) {
                        _currentPosition -= 1;
                        _digits[_currentPosition] = "";
                      }
                    });
                  },
                ),
              )
            );
          }
          if (index == 9) {
            return const Expanded(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  enableFeedback: true,
                ),
              )
            );
          }
          return Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                enableFeedback: true,
                child: Center(
                  child: Text(
                    "${(index == 10) ? 0 : index + 1}",
                    style: const TextStyle(
                      fontSize: 40,
                      color: secondColor,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ),
                onTap: () {
                  print('key ${index + 1}');
                  if (_currentPosition < 4) {
                    setState(() {
                      _digits[_currentPosition] = "${(index == 10) ? 0 : index + 1}";
                      _currentPosition += 1;
                    });
                  }
                }
              ),
            )
          );
        },),
      ),
    ));

    return Container(
      // margin: const EdgeInsets.only(left: 46.0, top: 30,),
      margin: const EdgeInsets.only(left: 46.0,),
      child: SizedBox(
        height: 200,
        width: 200,
        // color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _keys.toList(),
        ),
      )
    );
  }

  bool verifierCode() {
    String phoneNumber = "";
    bool validation = false;
    setState(() {
      for(int i = 0; i < _digits.length; i++) {
        phoneNumber += _digits[i];
      }
      // Appel de l'API pour vérifier le code
      validation = true;
      // Fluttertoast.showToast(msg: phoneNumber, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
      _compte = true;
    });
    return validation;
  }

  Widget _getDecompte() {
    Text text = const Text("");
    setState(() {
      text = Text.rich(
        TextSpan(
          text: "через 00:$_counter",
          style: const TextStyle(
            fontSize: 13,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              // print("Resent the code SMS");
              _initTimer();
              _startTimer();
            }
          /**
           * Revoir ce décompte
           */
        ),
      );
      if(_compte) {
        if(codExist) {
          text = const Text("");
        }
      }
    });
    return text;
  }

  @override
  Widget build(BuildContext context) {

    final _kodSms = Container(
      margin: const EdgeInsets.only(top: 30, left: 25.0, right: 25),
      child: Row(
        children: List<Widget>.generate(_digits.length, (index) => Container(
          width: 45.0,
          margin: const EdgeInsets.only(right: 20.0,),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 2.0,
                color: secondColor,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0,),
            child: Text(
              _digits[index],
              style: Theme.of(context).textTheme.headline3?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );

    final _poftaritKod = Container(
      margin: const EdgeInsets.only(top: 130, left: 8.0),
      child: Row(
        children: <Widget>[
          FlatButton (
            child: const Text(
              "Заполнить реквизиты",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: secondColor,
                fontWeight: FontWeight.w800,
              ),
            ),
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context)  => const CreateCompagny()),);
            },
            highlightColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          _getDecompte(),
        ],
      ),
    );

    final _btnSendKod = ClipRRect(
      child: Container(
        height: 65,
        width: 45,
        // margin: const EdgeInsets.only(top: 25),
        margin: const EdgeInsets.only(right: 37),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/connect.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: FlatButton(
          highlightColor: secondColor,
          onPressed: () {
            if(verifierCode()) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectTypeUser(),));
              codExist = true;
              // Fluttertoast.showToast(msg: "Ваш код был проверен...", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
            } else {
              codExist = false;
              Fluttertoast.showToast(msg: "Ваш код недействителен...", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
            }
          },
          padding: const EdgeInsets.all(0.0),
          child: Image.asset('assets/images/connect.png'),
        ),
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
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _titleKodSms_First,
                    _titleKodSms_Second,
                    _kodSms,
                    _poftaritKod,
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                // margin: const EdgeInsets.only(top: 40, left: 25.0, right: 25),
                margin: const EdgeInsets.only(bottom: 43,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildKeyboard(),
                    _btnSendKod,
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