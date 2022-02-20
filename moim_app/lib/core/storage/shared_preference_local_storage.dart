import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moim_app/core/storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceLocalStorage extends LocalStorage {
  static SharedPreferences? _preferences;

  bool get isReady => _preferences != null;
  final _controllers =
      StreamController<SharedPreferenceLocalStorage>.broadcast();

  @override
  void dispose() {
    _controllers.close();
  }

  @override
  Future<bool> init() async {
    _controllers.add(this);
    _preferences = await SharedPreferences.getInstance();
    _controllers.add(this);
    return isReady;
  }

  @override
  String? load(String key) {
    var data = _preferences?.getString(key);
    debugPrint('load from localStorage: $data');
    return data;
  }

  @override
  void save(String key, String value) {
    _preferences?.setString(key, value);
    debugPrint('saved: ($key, $value)');
  }
}
