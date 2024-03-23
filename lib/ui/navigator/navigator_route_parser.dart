import 'package:flutter/material.dart';
import 'package:gasl2/ui/navigator/navigator_path.dart';

class NavigatorRouteParser extends RouteInformationParser<NavigatorPath> {
  @override
  Future<NavigatorPath> parseRouteInformation(
      RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.uri.path);
    final int? lotID;
    if (uri.pathSegments.length >= 2) {
      lotID = int.tryParse(uri.pathSegments[1]);
    } else {
      lotID = null;
    }

    return Future.value(NavigatorPath(selectedLotID: lotID));
  }

  @override
  RouteInformation? restoreRouteInformation(NavigatorPath configuration) {
    String uritxt = "/";
    final lotID = configuration.selectedLotID;
    if (lotID != null) {
      uritxt = "$uritxt/lot/$lotID";
    }
    var bibi = Uri(path: uritxt);
    return RouteInformation(uri: bibi);
  }
}
