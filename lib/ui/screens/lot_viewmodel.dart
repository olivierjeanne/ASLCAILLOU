import 'package:gasl2/data/models/lot.dart';
import 'package:gasl2/ui/screens/lot_screen.dart';

class LotViewViewModel extends ILotViewViewModel {
  @override
  bool isLoading = false;

  @override
  Lot selectedLot = Lot(num: 0);

  LotViewViewModel(this.selectedLot) {}
}
