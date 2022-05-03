
class Command {
  String idCmde;
  double montantTotal;
  List<String> listeProduits;
  String statut;
  String dateEmission;

  Command({
    required this.idCmde,
    required this.montantTotal,
    required this.listeProduits,
    required this.statut,
    required this.dateEmission,
  });
}

final listCommands = [
  /*Command(
    idCmde: '',
    montantTotal: 0.0,
    listeProduits: <String>[],
    statut: '',
    dateEmission: '',
  ),*/
  Command(
    idCmde: '#210351',
    montantTotal: 16390.0,
    listeProduits: <String>['Id00002', 'Id00007', 'Id00016',],
    statut: 'Собран',
    dateEmission: '12.06.20',
  ),
  Command(
    idCmde: '#225251',
    montantTotal: 11930.0,
    listeProduits: <String>['Id00002', 'Id00005', 'Id00012', 'Id00019',],
    statut: 'Собран',
    dateEmission: '22.08.20',
  ),
  Command(
    idCmde: '#229351',
    montantTotal: 13590.0,
    listeProduits: <String>['Id00002', 'Id00022'],
    statut: 'Отменен',
    dateEmission: '18.10.20',
  ),
  Command(
    idCmde: '#231519',
    montantTotal: 75500.0,
    listeProduits: <String>['Id00010', 'Id00029', 'Id00032',],
    statut: 'Подтвержден',
    dateEmission: '02.11.20',
  ),
  Command(
    idCmde: '#232203',
    montantTotal: 51390.0,
    listeProduits: <String>['Id00001', 'Id00015', 'Id00018', 'Id00026', 'Id00035',],
    statut: 'В процессе',
    dateEmission: '12.11.20',
  ),
  Command(
    idCmde: '#247111',
    montantTotal: 107390.0,
    listeProduits: <String>['Id00005', 'Id00010', 'Id00014', 'Id00023', 'Id00030', 'Id00035', 'Id00036',],
    statut: 'В процессе',
    dateEmission: '22.11.20',
  ),
  Command(
    idCmde: '#251107',
    montantTotal: 10390.0,
    listeProduits: <String>['Id00009', 'Id00012', 'Id00036',],
    statut: 'В пути',
    dateEmission: '12.03.21',
  ),
  Command(
    idCmde: '#261823',
    montantTotal: 15390.0,
    listeProduits: <String>['Id00017', 'Id00020', 'Id00030',],
    statut: 'Доставлено',
    dateEmission: '12.03.21',
  ),
];