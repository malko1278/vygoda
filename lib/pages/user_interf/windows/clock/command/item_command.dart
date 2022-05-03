
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/models/data/command_product.dart';

import 'command_screen.dart';

class ItemCommand extends StatefulWidget {
  final Command listCommand;
  const ItemCommand(this.listCommand, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return InitState(listCommand);
  }
}

class InitState extends State<ItemCommand> {
  Command _listCommand;
  var _colorStatus;
  var _actionUser;
  var _colorActionUser;
  var _colorCommand;
  var _colorOther;

  InitState(this._listCommand);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listCommand = widget.listCommand;
    _colorOther = firstColor;
    _colorCommand = Colors.white;
    _colorStatus = _getColorStatus();
    _actionUser = _getActionUser();
    _colorActionUser = _getColorActionUser();
  }

  Color _getColorStatus() {
    var couleur;
    switch(_listCommand.statut) {
      case 'Собран':
        couleur = Colors.red;
        break;
      case 'Подтвержден':
        couleur = Colors.red;
        break;
      case 'В процессе':
        couleur = Colors.red;
        break;
      case 'В пути':
        couleur = Colors.red;
        break;
      case 'Доставлено':
        couleur = secondColor;
        break;
      case 'Отменен':
        couleur = secondColor;
        break;
    }
    return couleur;
  }

  Color _getColorActionUser() {
    var couleur;
    switch(_listCommand.statut) {
      case 'Собран':
        couleur = Colors.red;
        break;
      case 'Подтвержден':
        couleur = Colors.red;
        break;
      case 'В процессе':
        couleur = Colors.red;
        break;
      case 'В пути':
        couleur = Colors.red;
        break;
      case 'Доставлено':
        couleur = Colors.grey.shade400;
        break;
      case 'Отменен':
        couleur = Colors.grey.shade400;
        break;
    }
    if(_colorCommand == secondColor) {
      couleur = Colors.white;
    }
    return couleur;
  }

  String _getActionUser() {
    var action;
    switch(_listCommand.statut) {
      case 'Собран':
        action = 'Отменить заказ';
        break;
      case 'Подтвержден':
        action = 'Отменить заказ';
        break;
      case 'В процессе':
        action = 'Отменить заказ';
        break;
      case 'В пути':
        action = '';
        break;
      case 'Доставлено':
        action = 'Повторить заказ';
        break;
      case 'Отменен':
        action = 'Повторить заказ';
        break;
    }
    return action;
  }

  void _executeAction() {
    if(_actionUser == 'Отменить заказ') {
      /**
       * Changer le statut de la commande, en annulant la commande
       */
    } else {
      if(_actionUser == 'Повторить заказ') {
        /**
         * Récupération de tous les produits de la commande, et ajout de ces produits
         * dans le panier de l'utilisateur.
         */
      }
    }
  }

  void _changeColorCommand() {
    setState(() {
      if(_colorCommand == Colors.white) {
        _colorCommand = secondColor;
        _colorOther = Colors.white;
        _colorStatus = Colors.white;
        _colorActionUser = firstColor;
      } else {
        _colorCommand = Colors.white;
        _colorOther = firstColor;
        _colorStatus = _getColorStatus();
        _colorActionUser = _getColorActionUser();
      }
      Navigator.push(context, MaterialPageRoute(builder: (context)  => CommandScreen(_listCommand)));
    });
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: _changeColorCommand,
      child: Card(
        color: _colorCommand,
        elevation: 8,
        child: SizedBox(
          height: 100.0,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 60.0,
                margin: const EdgeInsets.only(left: 25.0,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _listCommand.idCmde,
                      style: TextStyle(
                        color: _colorOther,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      _listCommand.statut,
                      style: TextStyle(
                        color: _colorStatus,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      _listCommand.dateEmission,
                      style: TextStyle(
                        color: _colorOther,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 60.0,
                width: 150.0,
                // color: Colors.blueGrey,
                margin: const EdgeInsets.only(right: 25.0,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '${_listCommand.montantTotal} ₽',
                      style: TextStyle(
                        color: _colorOther,
                        fontSize: 20.0,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Посмотреть чек',
                        style: TextStyle(
                          color: _colorOther,
                          fontSize: 12.0,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                          print('Afficher le chèque');
                          },
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: _actionUser,
                        style: TextStyle(
                          color: _colorActionUser,
                          fontSize: 10.0,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _executeAction();
                          },
                      ),
                    ),
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