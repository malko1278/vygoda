
import 'package:flutter/material.dart';

import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/pages/user_interf/user_interface.dart';

class CreateCompagny extends StatefulWidget {
  const CreateCompagny({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<CreateCompagny> {
  var contrlTextField_one;
  var contrlTextField_twoo;
  var contrlTextField_three;
  var contrlTextField_four;
  var contrlTextField_five;
  var contrlTextField_six;
  var contrlTextField_seven;
  var contrlTextField_heigth;
  var contrlTextField_nine;

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

  final _titleDataCpy = Container(
    alignment: Alignment.bottomLeft,
    margin: const EdgeInsets.only(top: 10),
    child: const Text(
      'Данные компании',
      style: TextStyle(
        color: firstColor,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
    ),
  );

  final _titleAdressJ = Container(
    alignment: Alignment.bottomLeft,
    margin: const EdgeInsets.only(top: 20),
    child: const Text(
      'Юридический адрес',
      style: TextStyle(
        color: firstColor,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
    ),
  );

  bool saveCompany() {
    setState(() {
      // var phoneNumber = "+7" + nameController.text;
      // Instruction d'envoie des données à l'API pour enregistrement dans la base de données
      // Reception du message retour
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {

    final textField_one = Container(
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
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: "*Наименование:",
        ),
      ),
    );

    final textField_twoo = Container(
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
          labelText: "*ИНН:",
        ),
      ),
    );

    final textField_three = Container(
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

    final textField_four = Container(
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
        controller: contrlTextField_four,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: "*Email:",
        ),
      ),
    );

    final textField_five = Container(
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
        controller: contrlTextField_five,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: "*Наименование:",
        ),
      ),
    );

    final textField_six = Container(
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
        controller: contrlTextField_six,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: "Город/Населенный пункт:",
        ),
      ),
    );

    final textField_seven = Container(
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
        controller: contrlTextField_seven,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: "*Улица:",
        ),
      ),
    );

    final textField_heigth = Container(
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
        controller: contrlTextField_heigth,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: "*Дом, корпус:",
        ),
      ),
    );

    final textField_nine = Container(
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
        controller: contrlTextField_nine,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: "*Офис/комната:",
        ),
      ),
    );

    final _buttonView = Container(
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 40, left: 45.0, right: 45.0, bottom: 0.0),
      child: RaisedButton(
        child: const Text(
          "Продолжить",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: () {
          if(saveCompany()) {
            // Navigator.pop(context, false);
            Navigator.push(context, MaterialPageRoute(builder: (context)  => const UserInterface()));
          }
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
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Новая компания',
          style: TextStyle(
            color: firstColor,
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
      ),
      backgroundColor: thirdColor,
      body: Container(
        // margin: const EdgeInsets.only(top: 80,),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.only(top: 0, left: 15.0, right: 15.0, bottom: 0.0),
            // color: Colors.brown,
            child: Column(
              children: <Widget>[
                _titleDataCpy,
                textField_one,
                textField_twoo,
                textField_three,
                textField_four,
                _titleAdressJ,
                textField_five,
                textField_six,
                textField_seven,
                textField_heigth,
                textField_nine,
                _buttonView,
              ],
            ),
          ),
        ),
      ),
    );
  }
}