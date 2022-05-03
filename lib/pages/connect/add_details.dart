
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/pages/user_interf/user_interface.dart';

import 'create_compagny.dart';

class addDetails extends StatefulWidget {
  const addDetails({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<addDetails> {

  final _titleAddFile = Container(
    margin: const EdgeInsets.only(top: 80, left: 25.0, right: 25),
    child: const Text(
      "Пропустите при \nнеобходимости",
      style: TextStyle(
        color: Colors.white,
        fontSize: 30.0,
        fontWeight: FontWeight.w800,
      ),
    ),
  );

  final _labelTakeFile = const Text(
    "Приложить файл",
    style: TextStyle(
      color: Colors.white,
      fontSize: 13.0,
      fontWeight: FontWeight.w800,
    ),
  );

  void _addFile() {
    setState(() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['png', 'jpg', 'pdf', 'doc', 'csv'],
      );
      if(result != null) {
        // String path = result.files.single.path.toString();
        File file = File(result.files.single.path.toString());
        debugPrint("Content File : " + result.toString());
        debugPrint("File Route : " + file.toString());

        // Upload file
        // await FirebaseStorage.instance.ref('uploads/$fileName').putData(fileBytes);
        // Enregistrer le fichier dans le serveur
        // Transfert du fichier dans l'API, pour stockage dans la base de donnée et renvoie du resultat
      } else {
        // User canceled the picker
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final _iconeAddFile = ClipRRect(
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.only(left: 10.0, bottom: 10.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/trombone.png'),
          ),
        ),
        child: FlatButton(
          onPressed: _addFile,
          highlightColor: const Color(0xFF1eb8ce),
          padding: const EdgeInsets.all(0.0),
          child: Image.asset('assets/images/trombone.png'),
        ),
      ),
    );

    final takeFileBottom = Container(
        margin: const EdgeInsets.only(top: 40, left: 25.0),
        child: Row(
          children: <Widget>[
            _labelTakeFile,
            _iconeAddFile,
          ],
        )
    );

    final _titleAddFile_3 = Container(
      margin: const EdgeInsets.only(top: 40, left: 8.0),
      child: FlatButton (  // RaisedButton (
        child: const Text(
          "Заполнить реквизиты",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)  => const CreateCompagny()),);
        },
        highlightColor: secondColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
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
            Navigator.push(context, MaterialPageRoute(builder: (context)  => const UserInterface()));
          },
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
          _titleAddFile,
          takeFileBottom,
          _titleAddFile_3,
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