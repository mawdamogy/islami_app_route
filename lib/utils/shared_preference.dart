import 'package:shared_preferences/shared_preferences.dart';

/// save list  write data
/// get list  read data
class SharedPreference {
  static const String mostrecentlyKey = 'Most_recently';
}

saveNewSuraList(int newsuraindex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostrecentlyIndiceslist =
      prefs.getStringList(SharedPreference.mostrecentlyKey) ?? [];
  if (mostrecentlyIndiceslist.contains('$newsuraindex')) {
    mostrecentlyIndiceslist.remove('$newsuraindex');
    mostrecentlyIndiceslist.insert(0, '$newsuraindex');
  } else {
    mostrecentlyIndiceslist.insert(0, '$newsuraindex');
  }
  if (mostrecentlyIndiceslist.length > 5) {
    mostrecentlyIndiceslist.removeLast();
  }
  prefs.setStringList(
      SharedPreference.mostrecentlyKey, mostrecentlyIndiceslist);
}


