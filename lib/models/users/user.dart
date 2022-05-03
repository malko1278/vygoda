
class User {
  // final bool statLike;
  String numTel;
  List<String> myBasket;
  List<String> favorites;

  User({
    required this.numTel,
    required this.myBasket,
    required this.favorites,
  });
}
// final List<int> listQtes = <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

final userList = [
  User(
    numTel: '',
    myBasket: <String>[],
    favorites: <String>[],
  ),
  User(
    numTel: '+79527566598',
    myBasket: <String>['Id00001', 'Id00025',],
    favorites: <String>['Id00001', 'Id00009', 'Id00011', 'Id00025', 'Id00030', 'Id00031',],
  ),
  User(
    numTel: '+79527587298',
    myBasket: <String>['Id00030',],
    favorites: <String>['Id00002', 'Id00007', 'Id00016', 'Id00020', 'Id00030',],
  ),
  User(
    numTel: '+79527566123',
    myBasket: <String>['Id00011',],
    favorites: <String>['Id00001', 'Id00009', 'Id00011', 'Id00025', 'Id00030', 'Id00031',],
  ),
  User(
    numTel: '+79520566598',
    myBasket: <String>[],
    favorites: <String>['Id00014', 'Id00029', 'Id00001',],
  ),
  User(
    numTel: '+79527968598',
    myBasket: <String>[],
    favorites: <String>['Id00013',],
  ),
  User(
    numTel: '+79204566598',
    myBasket: <String>['Id00001',],
    favorites: <String>['Id00001', 'Id00028', 'Id00030', 'Id00033',],
  ),
  User(
    numTel: '+79527566332',
    myBasket: <String>[],
    favorites: <String>['Id00021', 'Id00030', 'Id00031',],
  ),
  User(
    numTel: '+79527511298',
    myBasket: <String>[],
    favorites: <String>['Id00025', 'Id00036',],
  ),
];