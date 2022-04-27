import 'package:carlock/model/user.dart';
import 'package:carlock/repository/auth_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthenticationService {
  late Box<User> _userBox;

  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    _userBox = await Hive.openBox('users');

    await _userBox.clear();

    await _userBox.add(User('user', 'password'));
    await _userBox.add(User('user2', 'password2'));
  }

  Future<String?> authenticate(String username, String password) async {
    final success = await AuthRepository().login(username, password);

    if (success) {
      return username;
    } else {
      return null;
    }
  }
}