import 'package:flutter/material.dart';
import 'package:gasl2/data/models/lot.dart';
import 'package:gasl2/ui/widgets/itemlist_lot.dart';
import 'package:search_page/search_page.dart';

abstract class ITresoViewModel extends ChangeNotifier {
  List<Lot> get listeLots;
  bool get isLoading;
  Color colorRangeLot(double solde);
}

class TresoView extends StatelessWidget {
  const TresoView(this.viewModel, {Key? key}) : super(key: key);

  final ITresoViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        const SizedBox(height: 8),
        Expanded(
            child: AnimatedBuilder(
                animation: viewModel,
                builder: (context, _) {
                  if (viewModel.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const SizedBox(height: 8);
                  }
                }))
      ]),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Rechercher un lot',
        onPressed: () => showSearch(
            context: context,
            delegate: SearchPage(
                onQueryUpdate: print,
                items: viewModel.listeLots,
                searchLabel: 'Rechercher Lot',
                suggestion: const Center(
                  child: Text('Filtrer par numéro de lot ou par nom'),
                ),
                failure: const Center(
                  child: Text('Aucun lot trouvé !'),
                ),
                filter: (person) => [
                      person.lastProprio?.nomprenom,
                      person.num.toString(),
                    ],
                sort: (a, b) => a.compareTo(b),
                builder: (person) => ItemLot(
                      lot: person,
                      rangelot: viewModel.colorRangeLot(person.solde),
                    )

                /* ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue[900],
                        child: Text(person.num.toString()),
                      ),
                      title: Text(
                          '${person.lastProprio?.mrmme} ${person.lastProprio?.nomprenom}'),
                      subtitle: Text(
                          '${person.lastProprio?.adresse} ${person.lastProprio?.cp} ${person.lastProprio?.ville}'),
                      trailing: Text('${person.solde}'),
                    ) */

                )),
        child: const Icon(Icons.search),
      ),
    );
  }
}
