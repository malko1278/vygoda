
class Specification {
  final bool manager;
  final int number;
  final int nbProduct;
  final String pricePacket;

  Specification({
    required this.manager,
    required this.number,
    required this.nbProduct,
    required this.pricePacket,
  });
}

final specificList = [
  Specification(
    manager: true,
    number: 0,
    nbProduct: 0,
    pricePacket: '',
  ),
  Specification(
    manager: false,
    number: 1,
    nbProduct: 9,
    pricePacket: '29 630 ₽',
  ),
  Specification(
    manager: false,
    number: 2,
    nbProduct: 10,
    pricePacket: '25 890 ₽',
  ),
  Specification(
    manager: false,
    number: 3,
    nbProduct: 5,
    pricePacket: '15 890 ₽',
  ),
  Specification(
    manager: false,
    number: 4,
    nbProduct: 12,
    pricePacket: '23 800 ₽',
  ),
];