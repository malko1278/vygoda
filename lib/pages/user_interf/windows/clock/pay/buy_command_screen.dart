
import 'package:flutter/material.dart';
import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/models/data/pay_type.dart';
// import 'package:vygoda/pages/user_interf/windows/clock/pay/screen_valid_paye.dart';

import 'config_command_screen.dart';

class BuyCommandScreen extends StatefulWidget {
  const BuyCommandScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<BuyCommandScreen> with AutomaticKeepAliveClientMixin {
  var paySelected;
  var _colorBorderU;
  List<bool> _colorBorder = [];
  List<PayType> typePaiement = [];
  Widget contentModePay = Container();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paySelected = null;
    _colorBorderU = Colors.white;
    for(var i = 0; i < payeList.length; i++) {
      typePaiement.add(payeList[i]);
      _colorBorder.add(false);
    }
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

  _onColorChanged(PayType modPay, int posit) {
    setState(() {
      paySelected = modPay;
      _colorBorder[posit] = true;
      for(int i = 0; i < _colorBorder.length; i++) {
        if(i != posit) {
          _colorBorder[i] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Size _size = MediaQuery.of(context).size;

    Widget _getModPayment(PayType modPay, int posit) {
      return Container(
        width: _size.width,
        height: 80,
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(
            color: _colorBorder[posit] == true? secondColor : Colors.white,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 35.0,
                  height: 35.0,
                  margin: const EdgeInsets.only(left: 10, top: 15,),
                  child: CircleAvatar(
                    backgroundColor: modPay.colorElt,
                    child: Image.asset(
                      modPay.imagAffich,
                      width: 25.0,
                      height: 25.0,
                    ),
                  ),
                ),
                Container(
                  width: _size.width-(55+80),
                  height: 60.0,
                  margin: const EdgeInsets.only(left: 10, bottom: 10, top: 15,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        modPay.title,
                        style: const TextStyle(
                          color: firstColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 4.0,),
                        child: Text(
                          modPay.massagAffich,
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 60.0,
                  height: 80.0,
                  child: Radio(
                    value: modPay,
                    groupValue: paySelected,
                    activeColor: secondColor,
                    onChanged: (value) {
                      paySelected = value;
                      _onColorChanged(paySelected, posit);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    List<Widget> _listOptionPay = [];
    for(var i = 0; i < typePaiement.length; i++) {
      _listOptionPay.add(_getModPayment(typePaiement[i], i));
    }

    final _contentlistPaye = Column(
      children: _listOptionPay,
    );

    final _buttonView = Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 55.0, right: 55.0, bottom: 30.0),
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
                  const ConfigCommandScreen(),
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
        height: double.infinity,
        margin: const EdgeInsets.only(top: 0, left: 5.0, right: 5.0, bottom: 0.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: _contentlistPaye,
                physics: const ClampingScrollPhysics(),
              ),
            ),
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