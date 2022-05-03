
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/models/data/command_product.dart';

import 'command/item_command.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<HistoryScreen> with AutomaticKeepAliveClientMixin {

  void _addFile() {
    setState(() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['jpg', 'jpeg'],
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

        /**
         * Envoyer l'image par le tchat avec le manager
         */
      } else {
        // User canceled the picker
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Size _size = MediaQuery.of(context).size;

    final _getAppBar = Container(
      height: 75,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 23,),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 5.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo_vygoda.png',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
            width: _size.width-205,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  "История заказов",
                  style: TextStyle(
                    fontSize: 20,
                    color: firstColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            width: 90,
            margin: const EdgeInsets.only(right: 10.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  onPressed: _addFile,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.red,
                    size: 35.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: thirdColor,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            _getAppBar,
            Expanded(
              child: ListView.builder(
                itemCount: listCommands.length,
                itemBuilder: (context, index) {
                  return ItemCommand(listCommands[index]);
                },
                padding: const EdgeInsets.only(left: 5.0, top: 2.0, right: 5.0, bottom: 2.0),
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