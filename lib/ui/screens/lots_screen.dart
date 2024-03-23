import 'package:flutter/material.dart';
import 'package:gasl2/data/models/proprio.dart';

abstract class ILotViewModel extends ChangeNotifier {
  List<Proprio> get listeLots;
  bool get isLoading;
}

class ListeLots extends StatelessWidget {
  final ILotViewModel viewModel;

  const ListeLots(this.viewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const TextField(
                decoration: InputDecoration(
              labelText: "Recherche",
            )),
            const SizedBox(height: 8),
            Expanded(
                child: AnimatedBuilder(
                    animation: viewModel,
                    builder: (context, _) {
                      if (viewModel.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return ListView.separated(
                            itemBuilder: _lotCellBuilder,
                            separatorBuilder: (_, index) => const Divider(),
                            itemCount: viewModel.listeLots.length);
                      }
                    }))
          ],
        ));
  }

  Widget _lotCellBuilder(BuildContext context, int index) {
    final lot = viewModel.listeLots[index];
    return ListTile(
        title: Text(lot.lot), trailing: Text(lot.mrmme + lot.nomprenom));
  }
}
