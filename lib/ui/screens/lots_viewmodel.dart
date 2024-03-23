import 'package:gasl2/data/controlers/remote_data.dart';
import 'package:gasl2/data/models/proprio.dart';
import 'package:gasl2/data/usecases/lots_usecase.dart';
import 'package:gasl2/ui/screens/lots_screen.dart';

class LotViewModel extends ILotViewModel {
  final IRemoteDataManager _remoteDataManager;

  @override
  bool isLoading = false;

  @override
  List<Proprio> listeLots = [];

  LotViewModel(this._remoteDataManager) {
    loadLotList();
  }

  Future<List<Proprio>> loadLotList() async {
    isLoading = true;
    notifyListeners();
    final useCase = LotUseCase(remoteData: _remoteDataManager);
    listeLots = await useCase.fetchAllProprios();
    isLoading = false;
    notifyListeners();
    return listeLots;
  }
}
