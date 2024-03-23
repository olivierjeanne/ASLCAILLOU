class Proprio {
  final int id;
  final DateTime entrydate;
  final int num;
  final String mrmme;
  final String nomprenom;
  final String adresse;
  final String cp;
  final String ville;
  final String lot;
  final String tel;
  final String mail;
  final String commentaire;
  final String gpsx;
  final String gpsy;

  const Proprio(
      {required this.id,
      required this.entrydate,
      required this.num,
      required this.mrmme,
      required this.nomprenom,
      required this.adresse,
      required this.cp,
      required this.ville,
      required this.lot,
      required this.tel,
      required this.mail,
      required this.commentaire,
      required this.gpsx,
      required this.gpsy});

  factory Proprio.fromMap(Map<String, dynamic> map) {
    //if (map == null) return null;
    return Proprio(
        id: int.tryParse(map['id']) ?? 0,
        entrydate: DateTime.tryParse(map['entrydate']) ?? DateTime.now(),
        num: int.tryParse(map['num']) ?? 0,
        mrmme: map['mrmme'] ?? '',
        nomprenom: map['nomprenom'] ?? '',
        adresse: map['adresse'] ?? '',
        cp: map['cp'] ?? '',
        ville: map['ville'] ?? '',
        lot: map['lot'] ?? '',
        tel: map['tel'] ?? '',
        mail: map['mail'] ?? '',
        commentaire: map['commentaire'],
        gpsx: map['gpsx'] ?? '',
        gpsy: map['gpsy'] ?? '');
  }
}
