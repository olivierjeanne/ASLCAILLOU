import 'package:gasl2/data/controlers/remote_data.dart';
import 'package:gasl2/data/models/lot.dart';
import 'package:gasl2/data/models/opa.dart';
import 'package:gasl2/data/models/proprio.dart';

class LotUseCase {
  final IRemoteDataManager _remoteData;

  LotUseCase({required IRemoteDataManager remoteData})
      : _remoteData = remoteData;

  Future<List<Lot>> fetchAll() async {
    return _remoteData.getLots();
  }

  Future<List<Proprio>> fetchAllProprios() async {
    return _remoteData.getProprios();
  }

  Future<List<Opa>> fetchAllOpas() async {
    return _remoteData.getOpas();
  }
}
