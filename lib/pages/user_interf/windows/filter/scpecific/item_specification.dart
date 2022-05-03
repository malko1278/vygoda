
import 'package:flutter/material.dart';

import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/models/data/specification.dart';
import 'package:vygoda/pages/user_interf/windows/filter/actions/list_actions.dart';

import 'add_specification.dart';

class ItemSpecification extends StatelessWidget {
  final int index;
  const ItemSpecification(this.index);

  Widget _getSpecification(BuildContext context) {
    if(specificList[index].manager == true) {
      return Positioned(
        child: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)  => const AddSpecification()));
          },
          highlightColor: secondColor,
          icon: Image.asset('assets/images/bouton_plus.png'),
          iconSize: 15,
        ),
        bottom: 15, right: 37,
      );
    } else {
      return Positioned(
        child: GestureDetector(
          onTap: () {
            var titleAppBar = 'Спецификации N° ${specificList[index].number}';
            Navigator.push(context, MaterialPageRoute(builder: (context)  => ListActions(titleAppBar)));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'N° ${specificList[index].number}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
              Text(
                specificList[index].nbProduct.toString() + ' тоиаров',
                style: const TextStyle(
                  fontSize: 14,
                  color: firstColor,
                ),
              ),
              Text(
                specificList[index].pricePacket.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  color: firstColor,
                ),
              ),
            ],
          ),
        ),
        bottom: 15, left: 10,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 6, right: 4),
      child: Stack(
        children: <Widget>[
          const Image(
            image: AssetImage('assets/images/imag_dossier.png'),
            height: 90,
            width: 120,
            fit: BoxFit.fill,
          ),
          _getSpecification(context),
        ],
      ),
    );
  }
}