
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/models/views/user_option.dart';

import 'item_user_option.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<ProfilScreen> with AutomaticKeepAliveClientMixin {
  var _phoneNumber = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneNumber = '+237 699 046 773';
  }


  final _getAppBar = Container(
    height: 75,
    width: double.infinity,
    margin: const EdgeInsets.only(top: 23, left: 5.0,),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image.asset('assets/images/logo_vygoda.png',),
      ],
    ),
  );

  void _connectToWhatsapp({required app, required number}) async {
    var url;
    switch (app) {
      case 'telegram':
        String valer = "https://t.me/$number";
        url = valer;
        break;
      case 'viber':
        url = "viber://pa?chatURI=$number";
        break;
      case 'whatsapp':
        url = "$app://send?phone=$number";
        break;
    }
    await launch(url) ? canLaunch(url) : print('Can\'t open whatsapp');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Size _size = MediaQuery.of(context).size;

    final _infoYourManager = Container(
      height: 80,
      width: _size.width,
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: ((_size.width/3)/3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset('assets/images/phone_call.png',),
              ],
            ),
          ),
          Container(
            width: ((_size.width/3) + ((_size.width/3)/3) + (((_size.width/3)/3)/2) - 10),
            margin: const EdgeInsets.only(top: 5,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  '+7 912 323 24 85',
                  style: TextStyle(
                    color: firstColor,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Ваш менеджур',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14.0,
                  ),
                ),
                const Text(
                  'Тексттекст Тексттекст',
                  style: TextStyle(
                    color: firstColor,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: ((_size.width/3) + (((_size.width/3)/3)/2) - 10),
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Image.asset('assets/images/shopping_cart.png',),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Уровень цен',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 15.0,
                        ),
                      ),
                      const Text(
                        'Розница',
                        style: TextStyle(
                          color: firstColor,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    final _otherContactManager = Container(
      width: _size.width,
      margin: const EdgeInsets.only(top: 30, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Медссенджеры доступны по номеру:',
            style: TextStyle(
              color: firstColor,
              fontSize: 16.0,
            ),
          ),
          Text(
            _phoneNumber,
            style: const TextStyle(
              color: firstColor,
              fontSize: 16.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      _connectToWhatsapp(app: "telegram", number: _phoneNumber);
                    },
                    child: Image.asset('assets/images/telegram.png',),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      _connectToWhatsapp(app: "viber", number: _phoneNumber);
                    },
                    child: Image.asset('assets/images/viber.png',),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      _connectToWhatsapp(app: "whatsapp", number: _phoneNumber);
                    },
                    child: Image.asset('assets/images/whatsapp.png',)
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    List<Widget> _listOptionUser = [];
    for(var i = 0; i < listUserOption.length; i++) {
      _listOptionUser.add(ItemUserOption(listUserOption[i]));
    }
    _listOptionUser.add(_otherContactManager);

    final _contentlistOption = Column(
      children: _listOptionUser,
    );

    return Scaffold(
      backgroundColor: thirdColor,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            _getAppBar,
            _infoYourManager,
            const SizedBox(height: 10.0,),
            Image.asset('assets/images/line_max.png'),
            Expanded(
              // color: Colors.blue,
              // margin: const EdgeInsets.only(top: 1, left: 1),
              child: SingleChildScrollView(
                child: _contentlistOption,
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