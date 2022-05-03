
import 'package:flutter/material.dart';

import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/models/data/command_product.dart';

import 'item_product_cmde.dart';

class CommandScreen extends StatefulWidget {
  final Command listCommand;
  const CommandScreen(this.listCommand, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return InitState(listCommand);
  }
}

class InitState extends State<CommandScreen> {
  Command _listCommand;

  InitState(this._listCommand);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listCommand = widget.listCommand;
  }

  getAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context, false),
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.grey.shade500,
          size: 25.0,
        ),
      ),
      title: Text(
        'Заказ ${_listCommand.idCmde}',
        style: const TextStyle(
          fontSize: 20,
          color: firstColor,
          fontWeight: FontWeight.w800,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white.withOpacity(0.0),
      elevation: 0,
      actions: <Widget>[
        IconButton(
          onPressed: () {
            /**
             * Action permettant d'envoyer la commande au format pdf à partir
             * d'autres applications...
             */
          },
          icon: const Image(
            image: AssetImage('assets/images/files_transit.png'),
            height: 25.0,
            width: 25.0,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    final _firsInformation = Container(
      margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0,),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                '${_listCommand.montantTotal} ₽',
                style: const TextStyle(
                  color: firstColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '${_listCommand.listeProduits.length} позиций',
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.start,
              ),
              Text(
                _listCommand.dateEmission,
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ],
      ),
    );

    final _firstline = Container(
      margin: const EdgeInsets.only(top: 15.0, left: 0.0, right: 0.0),
      child: const Image(
        image: AssetImage('assets/images/line_max.png'),
        color: Colors.grey,
      ),
    );

    final _secondline = Container(
      margin: const EdgeInsets.only(top: 10.0, left: 0.0, right: 0.0),
      child: const Image(
        image: AssetImage('assets/images/line_max.png'),
        color: Colors.grey,
      ),
    );

    final _afficheDocument = Container(
      margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0,),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Документы',
                style: TextStyle(
                  color: firstColor,
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                // width: 20.0,
                //color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const Text(
                      '0',
                      style: TextStyle(
                        color: secondColor,
                        fontSize: 14.0,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade500,
                      size: 20.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );

    final listView = Expanded(
      child: ListView.builder(
        // padding: const EdgeInsets.only(top: 0.0, left: 4.0, right: 4.0,),
        itemCount: _listCommand.listeProduits.length,
        itemBuilder: (context, index) {
          return ItemProductCmdeState(_listCommand.listeProduits[index]);
        },
      ),
    );

    return Scaffold(
      backgroundColor: thirdColor,
      appBar: getAppBar(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            _firsInformation,
            _firstline,
            _afficheDocument,
            _secondline,
            listView,
          ],
        ),
      ),
    );
  }
}