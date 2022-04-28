import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> saveToken({@required token}) async {
  await Hive.openBox('myTokenBox'); //!hive open box
  var box = Hive.box('myTokenBox'); //!hive box
  box.put('token', token);
}

Future<String?> getToken() async {
  await Hive.openBox('myTokenBox'); //!hive open box
  var box = Hive.box('myTokenBox'); //!hive box
  try {
    return box.get('token');
  } catch (e) {
    Exception('Failed to get token');
  }
  return null;
}

Future<void> deleteToken() async {
  await Hive.openBox('myTokenBox'); //!hive open box
  var box = Hive.box('myTokenBox'); //!hive box
  box.delete('token');
}
