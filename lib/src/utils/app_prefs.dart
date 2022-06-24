import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class AppPrefs {
  AppPrefs._();

  static final AppPrefs _instance = AppPrefs._();

  static AppPrefs get instance => _instance;

  late Box _box;

  initListener() async {
    if (!kIsWeb) {
      Directory appDocDirectory = await getApplicationDocumentsDirectory();
      Hive..init(appDocDirectory.path);
    }
    _box = await Hive.openBox('AppPref');
  }

  void clear() {
    _box.delete('accessToken');
    _box.delete('themeModel');
  }

  set themeModel(String? value) => _box.put('themeModel', value);

  String? get themeModel => _box.get('themeModel');

  set languageCode(String? value) => _box.put('languageCode', value);

  String? get languageCode => _box.get('languageCode');

  final String _accessToken = 'accessToken';
  final String _refreshToken = 'refreshToken';
  Future save(String key, String? value) => _box.put(key, value);

  dynamic getNormalToken() async {
    var result = _box.get(_accessToken);
    // if (result != null) {
    //   DateTime? expiryDate = Jwt.getExpiryDate(result.toString());
    //   if (expiryDate != null &&
    //       expiryDate.millisecondsSinceEpoch <
    //           DateTime.now().millisecondsSinceEpoch) {
    //     String refresh = _box.get(refreshToken).toString();
    //     var newToken = await _repository.refreshProToken(refresh);
    //     if (newToken?.accessToken != null) {
    //       result = newToken!.accessToken;
    //       _box.put(accessToken, result.toString());
    //     }
    //   }
    // }
    return result;
  }
}
