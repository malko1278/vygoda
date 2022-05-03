
import 'package:flutter/material.dart';
import 'package:vygoda/color/color_constant.dart';

import '../pay/buy_command_screen.dart';

class ScreeDecoration extends StatefulWidget {
  const ScreeDecoration({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<ScreeDecoration> with AutomaticKeepAliveClientMixin {
  var contrlTextField_one;
  var contrlTextField_twoo;
  var contrlTextField_three;
  var contrlTextField_four;
  var contrlTextField_five;
  var contrlTextField_six;
  var contrlTextField_seven;
  var contrlTextField_heigth;
  var contrlTextField_nine;
  String _currentValue = "";
  List<String> _listUserCoice = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      contrlTextField_one = TextEditingController();
      contrlTextField_twoo = TextEditingController();
      contrlTextField_three = TextEditingController();
      contrlTextField_four = TextEditingController();
      contrlTextField_five = TextEditingController();
      contrlTextField_six = TextEditingController();
      contrlTextField_seven = TextEditingController();
      contrlTextField_heigth = TextEditingController();
      contrlTextField_nine = TextEditingController();
      _listUserCoice.add("...");
      _listUserCoice.add("Не звонить мне и удалить отсутствующий товар\nиз заказа");
      _listUserCoice.add("Не звонить мне и заменить товар на аналогичный\nпо цене, но с иными характеристиками (цвет, размер и т.п.)");
      _listUserCoice.add("Позвонить мне для внесения изменений в заказ");
      _currentValue = _listUserCoice.first;
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
    contrlTextField_five = null;
    contrlTextField_six = null;
    contrlTextField_seven = null;
    contrlTextField_heigth = null;
    contrlTextField_nine = null;
  }

  getAppBar() {
    return AppBar(
      title: const Text(
        "Оформление заказ",
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
      'Получатель заказа',
      style: TextStyle(
        color: firstColor,
        fontSize: 14.0,
        // fontWeight: FontWeight.w800,
      ),
    ),
  );

  final _titleSecondAction = Container(
    alignment: Alignment.bottomLeft,
    margin: const EdgeInsets.only(top: 10),
    child: Text(
      'На указанный email будет отправлен электронный чек \nо совершении покупки',
      style: TextStyle(
        color: Colors.grey.shade500,
        fontSize: 12.0,
        // fontWeight: FontWeight.w800,
      ),
    ),
  );

  final _titleThirdAction = Container(
    alignment: Alignment.bottomLeft,
    margin: const EdgeInsets.only(top: 10),
    child: Text.rich(
      TextSpan(
        text: "Вариаты замени",
        style: const TextStyle(
          color: firstColor,
          fontSize: 14.0,
          // fontWeight: FontWeight.w800,
        ),
        children: <TextSpan>[
          TextSpan(
            text: "\nЕсли каких-то товаров не окажется в наличии,\nчто нам следует делать?",
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    ),
  );

  final _titleValueProduct = Container(
    alignment: Alignment.bottomLeft,
    margin: const EdgeInsets.only(top: 20),
    child: Text.rich(
      TextSpan(
        text: "Стоимость товаров",
        style: const TextStyle(
          color: firstColor,
          fontSize: 14.0,
          // fontWeight: FontWeight.w800,
        ),
        children: <TextSpan>[
          TextSpan(
            text: "............................................................",
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 12.0,
            ),
          ),
          const TextSpan(
            text: "1235",
            style: TextStyle(
              color: firstColor,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    ),
  );

  final _titleLivraison = Container(
    alignment: Alignment.bottomLeft,
    margin: const EdgeInsets.only(top: 10),
    child: Text.rich(
      TextSpan(
        text: "Доставка",
        style: const TextStyle(
          color: firstColor,
          fontSize: 14.0,
          // fontWeight: FontWeight.w800,
        ),
        children: <TextSpan>[
          TextSpan(
            text: "...................................................................................",
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 12.0,
            ),
          ),
          TextSpan(
            text: "250",
            style: TextStyle(
              color: firstColor,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    ),
  );

  final _titleSomme = Container(
    alignment: Alignment.bottomLeft,
    margin: const EdgeInsets.only(top: 10),
    child: Text.rich(
      TextSpan(
        text: "Всего",
        style: const TextStyle(
          color: firstColor,
          fontSize: 14.0,
          // fontWeight: FontWeight.w800,
        ),
        children: <TextSpan>[
          TextSpan(
            text: ".........................................................................................",
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 12.0,
            ),
          ),
          const TextSpan(
            text: "1485",
            style: TextStyle(
              color: firstColor,
              fontSize: 12.0,
            ),
          ),
        ],
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
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: "*Номер телефона:",
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
        keyboardType: TextInputType.text,
        controller: contrlTextField_twoo,
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: "*ФИО (как в паспорте):",
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
        keyboardType: TextInputType.emailAddress,
        controller: contrlTextField_three,
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: "*Email:",
        ),
      ),
    );

    final _textFieldFour = Container(
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
        keyboardType: TextInputType.streetAddress,
        controller: contrlTextField_four,
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: "*Адрес:",
        ),
      ),
    );

    final _enterComment = Container(
      height: 30.0,
      width: double.infinity,
      // color: Colors.blue,
      margin: const EdgeInsets.only(top: 15.0,),
      child: TextField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: "Комментарий к заказу",
        ),
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey.shade500,
        ),
        controller: contrlTextField_five,
        keyboardType: TextInputType.text,
      ),
    );

    final _dropDownButton = Container(
      margin: const EdgeInsets.only(top: 8.0,),
      width: double.infinity,
      // height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        // border: Border.all(color: Colors.deepOrange, width: 4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _currentValue, // currently selected item
          icon: const Icon(Icons.keyboard_arrow_down),
          iconSize: 24,
          items: _listUserCoice.map((item) => DropdownMenuItem<String>(
            child: Container(
              margin: const EdgeInsets.only(left: 12,),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 11,
                  // fontWeight: FontWeight.w800,
                ),
              ),
            ),
            value: item,
          )).toList(),
          onChanged: (value) => setState(() {
            if(value != null) {
              _currentValue = value;
            } else {
              _currentValue = _listUserCoice.first;
            }
          }),
        ),
      ),
    );

    final _buttonView = Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 30, left: 45.0, right: 45.0, bottom: 0.0),
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
              const BuyCommandScreen()
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

    final _listAllView = Column(
      children: <Widget>[
        _titlefirstAction,
        _textFieldOne,
        _textFieldTwoo,
        _textFieldThree,
        _titleSecondAction,
        _textFieldFour,
        _titleThirdAction,
        _dropDownButton,
        _enterComment,
        _titleValueProduct,
        _titleLivraison,
        _titleSomme,
        _buttonView,
      ],
    );

    return Scaffold(
      backgroundColor: thirdColor,
      appBar: getAppBar(),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.only(top: 0, left: 15.0, right: 15.0, bottom: 0.0),
        child: SingleChildScrollView(
          child: _listAllView,
          physics: const ClampingScrollPhysics(),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}