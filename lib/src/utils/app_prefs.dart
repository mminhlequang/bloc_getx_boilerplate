import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class AppPrefs {
  AppPrefs._();

  static late Box _box;

  static initListener() async {
    if (!kIsWeb) {
      Directory appDocDirectory = await getApplicationDocumentsDirectory();
      Hive..init(appDocDirectory.path);
    }
    _box = await Hive.openBox('AppPref');
  }

  static void clear() {
    _box.delete('accessToken');
    _box.delete('themeModel');
  }

  static set themeModel(String? theme) => _box.put('themeModel', theme);

  static String? get themeModel => _box.get('themeModel');

  static set languageCode(String? token) => _box.put('languageCode', token);

  static String? get languageCode => _box.get('languageCode');

  static String accessToken = 'accessToken';
  static String refreshToken = 'refreshToken';
  static Future save(String key, String? token) => _box.put(key, token);

  static dynamic getNormalToken() async {
    var result = _box.get(accessToken);
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
