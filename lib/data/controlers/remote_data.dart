import 'package:gasl2/data/models/lot.dart';
import 'package:gasl2/data/models/opa.dart';
import 'package:gasl2/data/models/proprio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

abstract class IRemoteDataManager {
  Future<List<Proprio>> getProprios();
  Future<List<Opa>> getOpas();
  Future<List<Lot>> getLots();
}

class RemoteData extends IRemoteDataManager {
  var urlProprio = Uri.http('www.elsusma.com', '/gasl/ToutProprio.php');
  var urlOpa = Uri.http('www.elsusma.com', '/gasl/ToutOpa.php');

  @override
  Future<List<Proprio>> getProprios() async {
    final response = await http.get(urlProprio);

    if (response.statusCode == 200) {
      var results = convert.jsonDecode(response.body) as List<dynamic>;

      if (results.isNotEmpty) {
        return results.map((e) => Proprio.fromMap(e)).toList();
      }
    }
    return [];
  }

  @override
  Future<List<Opa>> getOpas() async {
    final response = await http.get(urlOpa);

    if (response.statusCode == 200) {
      var results = convert.jsonDecode(response.body) as List<dynamic>;
      // final results =
      //     List<Map<String, dynamic>>.from(response.);
      if (results.isNotEmpty) {
        return results.map((e) => Opa.fromMap(e)).toList();
      }
    }
    return [];
  }

  @override
  Future<List<Lot>> getLots() async {
    List<Proprio> proprios = await getProprios();
    List<Opa> opas = await getOpas();
    List<Lot> lots = [];

    for (var prop in proprios) {
      if (!lots.any((item) => item.num == prop.num)) {
        Lot l1 = Lot(num: prop.num);
        l1.proprios.add(prop);
        lots.add(l1);
      } else {
        lots.firstWhere((element) => element.num == prop.num).addProprio(prop);
        //.add(prop);
      }
    }

    for (var opa in opas) {
      if (opa.lot > 0) {
        lots.firstWhere((element) => element.num == opa.lot).solde +=
            opa.xmontant;
        lots.firstWhere((element) => element.num == opa.lot).addOpa(opa);
      }
    }

    return lots;
  }
}
