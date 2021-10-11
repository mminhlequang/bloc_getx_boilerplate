import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

class ExampleModel {
  ExampleModel.fromJson(dynamic data) {}
}

class AppPrefs {
  AppPrefs._();

  static late Box _box;

  static BehaviorSubject<ExampleModel?> _watchExample = BehaviorSubject();

  static initListener() async {
    if (!kIsWeb) {
      Directory appDocDirectory = await getApplicationDocumentsDirectory();
      Hive..init(appDocDirectory.path);
    }
    _box = await Hive.openBox('AppPref');
    _box.watch(key: 'example').listen((event) {

    });
  }
  
  static void clear(){
    _box.delete('accessToken');
    _box.delete('themeModel');
  }

  static set accessToken(String? token) => _box.put('accessToken', token);

  static String? get accessToken => _box.get('accessToken');

  static set themeModel(String? theme) => _box.put('themeModel', theme);

  static String? get themeModel => _box.get('themeModel');

  //Example
  static set example(ExampleModel? data) {
    _box.put('example', jsonEncode(data ?? ""));
  }

  static ExampleModel? get example {
    final data = _box.get('example');
    if (data == null || data?.isEmpty) return null;
    return ExampleModel.fromJson(jsonDecode(data));
  }
}
