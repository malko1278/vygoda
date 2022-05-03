import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/pages/connect/send_code.dart';

class SendPhone extends StatefulWidget {
  const SendPhone({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SendPhone> {
  var nameController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      nameController = TextEditingController();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController = null;
  }

  final _titlePhone = Container(
    margin: const EdgeInsets.only(top: 80, left: 25.0,),
    child: const Text(
      "Добро пожоловать!",
      style: TextStyle(
        color: Colors.white,
        fontSize: 30.0,
        fontWeight: FontWeight.w800,
      ),
    ),
  );

  final _titleNumber = Container(
    margin: const EdgeInsets.only(top: 40, left: 25.0,),
    child: const Text(
      "Введите номер телефона, мы\nпришлем на него код верификации",
      style: TextStyle(
        color: Colors.white,
        fontSize: 17.7,
        // fontWeight: FontWeight.bold,
      ),
    ),
  );

  final _titlevariant = Container(
    margin: const EdgeInsets.only(top: 30, right: 40, left: 25.0,),
    child: const Text(
      "Или авторизуйтесь через соцсети",
      style: TextStyle(
        color: Colors.white,
        fontSize: 17.7,
        // fontWeight: FontWeight.bold,
      ),
    ),
  );

  final _iconVK = CircleAvatar(
    backgroundColor: secondColor,
    child: Container(
      width: 46.0,
      height: 46.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: secondColor,
        image: DecorationImage(
          image: AssetImage('assets/images/icone_vk.png'),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );

  final _iconfb = CircleAvatar(
    backgroundColor: secondColor,
    child: Container(
      width: 46.0,
      height: 46.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: secondColor,
        image: DecorationImage(
          image: AssetImage('assets/images/icone_fbk.png'),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );

  final _iconGoogle = CircleAvatar(
    backgroundColor: firstColor,
    child: Container(
      width: 46.0,
      height: 46.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        // color: Color(0xFF1eb8ce),
        image: DecorationImage(
          image: AssetImage('assets/images/icone_g.png'),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );

  final _iconMail = const CircleAvatar(
    backgroundColor: secondColor,
    child: Icon(
      Icons.alternate_email,
      color: firstColor,
      size: 30.0,
    ),
  );

  final _iconOK = CircleAvatar(
    backgroundColor: firstColor,
    child: Container(
      width: 46.0,
      height: 46.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        // color: Color(0xFF001c4c),
        image: DecorationImage(
          image: AssetImage('assets/images/icone_ok.png'),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );

  final _iconYand = CircleAvatar(
    backgroundColor: secondColor,
    child: Container(
      width: 36.0,
      height: 36.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: firstColor,
        image: DecorationImage(
          image: AssetImage(
            'assets/images/icone_yandex_bro.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );

  void sendSms() {
    setState(() {
      var phoneNumber = "+7" + nameController.text;
      Fluttertoast.showToast(msg: phoneNumber, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
    });
  }

  @override
  Widget build(BuildContext context) {

    final _titleFieldNumber = Container(
      margin: const EdgeInsets.only(top: 30, right: 55, left: 25.0,),
      child: TextField(
        autofocus: true,
        showCursor: true,
        keyboardType: TextInputType.number,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        maxLength: 10,
        controller: nameController,
        //  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
        decoration: const InputDecoration(
          prefixText: "+7",
          prefixStyle: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
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
          onPressed: () {
            sendSms();
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SendCode()));
          },
          padding: const EdgeInsets.all(0.0),
          child: Image.asset('assets/images/connect.png'),
        ),
      ),
    );

    final _iconSection = Container(
      margin: const EdgeInsets.only(top: 110, right: 70, left: 25.0,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _iconVK,
          _iconfb,
          _iconGoogle,
          _iconMail,
          _iconOK,
          _iconYand,
        ],
      ),
    );

    final _contentWidgetsPage = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _titlePhone,
        _titleNumber,
        _titleFieldNumber,
        _titlevariant,
        _iconSection,
      ],
    );

    return Scaffold(
      backgroundColor: firstColor,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: _contentWidgetsPage,
              ),
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
