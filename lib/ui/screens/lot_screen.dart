import 'package:flutter/material.dart';
import 'package:gasl2/data/models/lot.dart';

abstract class ILotViewViewModel extends ChangeNotifier {
  bool get isLoading;
  Lot get selectedLot;
}

class LotView extends StatefulWidget {
  const LotView({super.key, required this.viewModel});
  final ILotViewViewModel viewModel;

  @override
  State<LotView> createState() => _LotViewState();
}

class _LotViewState extends State<LotView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CircleAvatar(
              radius: 30,
              backgroundColor: const Color.fromRGBO(0, 0, 100, 1),
              child: Text(
                widget.viewModel.selectedLot.num.toString(),
                style: const TextStyle(
                    fontSize: 36, color: Color.fromARGB(255, 245, 246, 247)),
              )),
        ],
      ),
    );
  }
}
