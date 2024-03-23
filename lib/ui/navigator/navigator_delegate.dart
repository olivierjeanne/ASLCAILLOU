import 'package:flutter/material.dart';
import 'package:gasl2/data/models/proprio.dart';
import 'package:gasl2/ui/navigator/navigator_path.dart';

class NavigatorDelegate extends RouterDelegate<NavigatorPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigatorPath> {
  Proprio? _currentProprio;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  NavigatorPath? get currentConfiguration =>
      NavigatorPath(selectedLotID: _currentProprio?.id);

  @override
  GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(NavigatorPath configuration) {
    throw UnimplementedError();
  }
}
