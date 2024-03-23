import 'package:flutter/material.dart';
import 'package:gasl2/data/controlers/remote_data.dart';
import 'package:gasl2/ui/screens/treso_screen.dart';
import 'package:gasl2/ui/screens/treso_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GASL',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        //home: ListeLots(LotViewModel(RemoteData())),
        home: TresoView(TresoViewModel(RemoteData())));
  }
}
