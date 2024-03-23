import 'package:flutter/material.dart';
import 'package:gasl2/data/controlers/remote_data.dart';
import 'package:gasl2/data/models/lot.dart';
import 'package:gasl2/data/usecases/lots_usecase.dart';
import 'package:gasl2/ui/screens/treso_screen.dart';

class TresoViewModel extends ITresoViewModel {
  final IRemoteDataManager _remoteDataManager;
  @override
  bool isLoading = false;

  @override
  List<Lot> listeLots = [];

  TresoViewModel(this._remoteDataManager) {
    loadLotList();
  }

  Future<List<Lot>> loadLotList() async {
    isLoading = true;
    notifyListeners();
    final useCase = LotUseCase(remoteData: _remoteDataManager);
    listeLots = await useCase.fetchAll();
    isLoading = false;
    notifyListeners();
    return listeLots;
  }

  @override
  Color colorRangeLot(double solde) {
    Color retour = const Color.fromRGBO(171, 11, 18, 1);
    if (solde <= 0) {
      retour = const Color.fromRGBO(102, 187, 106, 1);
    } else if (solde <= 240) {
      retour = const Color.fromRGBO(255, 224, 130, 1);
    } else if (solde <= 360) {
      retour = const Color.fromRGBO(255, 167, 38, 1);
    } else if (solde <= 480) {
      const Color.fromRGBO(229, 115, 115, 1);
    }
    return retour;
  }
}
