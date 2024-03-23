import 'package:gasl2/data/models/opa.dart';
import 'package:gasl2/data/models/proprio.dart';

class Lot {
  List<Proprio>? _proprios = [];
  List<Opa>? _opas = [];
  final int num;
  double solde = 0;

  Lot({required this.num});

  List<Opa> get opas => _opas ?? [];
  List<Proprio> get proprios => _proprios ?? [];

  Proprio? get lastProprio =>
      proprios.isNotEmpty ? proprios[proprios.length - 1] : null;

  void addProprio(Proprio newProprio) {
    _proprios?.add(newProprio);
  }

  void addOpa(Opa newOpa) {
    _opas?.add(newOpa);
  }

  compareTo(Lot b) {
    return num.compareTo(b.num);
  }
}
