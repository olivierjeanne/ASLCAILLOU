import 'package:flutter/material.dart';
import 'package:gasl2/data/models/lot.dart';

class ItemLot extends StatelessWidget {
  const ItemLot({super.key, required this.lot, required this.rangelot});

  final Lot lot;
  final Color rangelot;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: rangelot, // Colors.blue[900],
        child: Text(lot.num.toString()),
      ),
      title: Text('${lot.lastProprio?.mrmme} ${lot.lastProprio?.nomprenom}'),
      subtitle: Text(
          '${lot.lastProprio?.adresse} ${lot.lastProprio?.cp} ${lot.lastProprio?.ville}'),
      trailing: Text('${lot.solde}'),
    );
  }
}
