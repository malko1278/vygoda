
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';
import 'package:vygoda/color/color_constant.dart';

class PayType {
  String title;
  String massagAffich;
  String imagAffich;
  Color colorElt;
  bool isUsed;

  PayType({
    required this.title,
    required this.massagAffich,
    required this.imagAffich,
    required this.colorElt,
    required this.isUsed,
  });
}

final payeList = [
  PayType(
    title: 'Наличные',
    imagAffich: 'assets/images/ruble.png',
    massagAffich: 'Курьер принимает толко наличные, просьба\nподготовить без сдачи',
    colorElt: secondColor,
    isUsed: false,
  ),
  PayType(
    title: 'Apple pay',
    imagAffich: 'assets/images/apple.png',
    massagAffich: 'Оплатить через Apple pay',
    colorElt: Colors.black,
    isUsed: false,
  ),
  PayType(
    title: 'Безналичный расчет для юр лиц',
    imagAffich: 'assets/images/bank.png',
    massagAffich: 'Мы сформируем для вас счет на оплату, и вы\nсможете оплатить его через ваш банк',
    colorElt: Colors.red,
    isUsed: false,
  ),
  PayType(
    title: 'Картой онлайн',
    imagAffich: 'assets/images/credit_card.png',
    massagAffich: 'Вы можете оплатить заказ прямо сейчас в\nприложении. Все платежи защищены и безопасны',
    colorElt: Colors.yellow,
    isUsed: false,
  ),
  PayType(
    title: 'Оплата по договору',
    imagAffich: 'assets/images/invoice.png',
    massagAffich: 'Тексттекст',
    colorElt: Colors.deepPurple,
    isUsed: false,
  ),
];