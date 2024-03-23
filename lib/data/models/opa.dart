class Opa {
  final int id;
  final DateTime date;
  final String description;
  final double montant;
  final int lot;
  final int debitcredit;
  final double xmontant;
  final String commentaires;
  final String testdopost;

  const Opa(
      {required this.id,
      required this.date,
      required this.description,
      required this.montant,
      required this.lot,
      required this.debitcredit,
      required this.xmontant,
      required this.commentaires,
      required this.testdopost});

  factory Opa.fromMap(Map<String, dynamic> map) {
    return Opa(
        id: int.tryParse(map['id']) ?? 0,
        date: DateTime.tryParse(map['Date']) ?? DateTime.now(),
        description: map['Description'] ?? '',
        montant: double.tryParse(map['Montant']) ?? 0,
        lot: map['Lot'] != null ? int.tryParse(map['Lot']) ?? 0 : 0,
        debitcredit: int.tryParse(map['DebitCredit']) ?? 0,
        xmontant: double.tryParse(map['xMontant']) ?? 0,
        commentaires: map['Commentaires'] ?? '',
        testdopost: map['Test_doPost'] ?? '');
  }
}
