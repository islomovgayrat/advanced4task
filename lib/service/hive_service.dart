import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'dart:convert';

class HiveService {
  static var box = Hive.box('pdp_online');

  static storeName(String name) async {
    await box.put('name', name);
  }

  static Future<String> loadName() async {
    return box.get('name');
  }

  static removeName() async {
    box.delete('name');
  }
}
