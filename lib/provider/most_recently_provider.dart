import 'package:flutter/material.dart';
import 'package:islami_app_route/utils/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentlyProvider extends ChangeNotifier {
  // data
  // function change data
  List<int> mostrecentlyList = [];
  getMostRecentlySuraList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostrecentlyIndicesAsString =
        prefs.getStringList(SharedPreference.mostrecentlyKey) ?? [];
    mostrecentlyList = mostrecentlyIndicesAsString
        .map(
          (e) => int.parse(e),
        )
        .toList();
    notifyListeners();
  }
}
