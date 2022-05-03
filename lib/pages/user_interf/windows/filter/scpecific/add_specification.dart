
import 'package:flutter/material.dart';

import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/pages/user_interf/windows/filter/scpecific/slide_specification/name_specification.dart';

class AddSpecification extends StatefulWidget {
  const AddSpecification({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

List myColors = <Color>[
  const Color(0xFFffdf8b),
  const Color(0xFFff8b8b),
  const Color(0xFF1eb8ce),
  const Color(0xFF8bacff),
  const Color(0xFF8dff8b),
  const Color(0xFFf68bff),
  const Color(0xFFc58bff),
];
Color usualColor = myColors[0];

class InitState extends State<AddSpecification> {
  final TextEditingController firstControler = TextEditingController();
  final TextEditingController secondControler = TextEditingController();

  final _titleAddSpecif = const Text(
    "Создать спецификацию",
    style: TextStyle(
      color: firstColor,
      fontSize: 20.0,
      fontWeight: FontWeight.w800,
    ),
  );

  final _titleCouleur = const Text(
    "Цвет спецификации",
    style: TextStyle(
      color: Colors.grey,
      fontSize: 16.0,
      // fontWeight: FontWeight.w800,
    ),
  );

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

  @override
  Widget build(BuildContext context) {

    firstControler.addListener(() {
      // print(firstControler.text); // Print current value
      // firstControler.text = "Demo Text"; // Set new value
    });
    secondControler.addListener(() {
      //
    });

    final _textFieldName = Padding(
      padding: const EdgeInsets.only(
          top: 50,
          bottom: 0.0,
          right: 40.0,
          left: 40.0
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        autofocus: true,
        controller: firstControler,
        autocorrect: false,
        style: const TextStyle(
          fontSize: 20,
        ),
        decoration: const InputDecoration(
          hintText: 'Введите название',
        ),
      ),
    );

    final _textFieldDefinit = Padding(
      padding: const EdgeInsets.only(
          top: 25.0,
          bottom: 0.0,
          right: 40.0,
          left: 40.0
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        autofocus: true,
        controller: secondControler,
        autocorrect: false,
        style: const TextStyle(
          fontSize: 20,
        ),
        decoration: const InputDecoration(
          hintText: 'Введите описание',
        ),
      ),
    );

    Widget buildIconBtn(Color myColor) => IconButton(
      onPressed: () {
        setState(() {
          usualColor = myColor;
        });
      },
      icon: Icon(
        Icons.circle,
        color: myColor.withOpacity(1.0),
        size: 35,
      ),
    );

    List<Widget> _boutonColorsList = [];
    for(var i = 0; i < 7; i++) {
      _boutonColorsList.add(buildIconBtn(myColors[i]));
    }

    final _buttonView = SizedBox(
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        child: const Text(
          "Создать",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: () {
          /**
           * Récupération des informations pour l'enrégistrement des informations
           * Puis, passage à la page des spécifications
           */
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context)  => const NameSpecification(),
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
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _titleAddSpecif,
                        _textFieldName,
                        _textFieldDefinit,
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 90, left: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _titleCouleur,
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 40.0,
                    margin: const EdgeInsets.only(top: 1.0, bottom: 0.0, right: 30.0, left: 30.0,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _boutonColorsList,
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 160.0, right: 50.0, left: 50.0,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buttonView,
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