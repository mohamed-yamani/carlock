import 'dart:convert';
import 'package:carlock/repository/save_get_token.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://matricule.icebergtech.net/api/token-auth/'),
      headers: {},
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      final token = responseJson['token'];
      await saveToken(token: token);
      return true;
    } else {
      // return false;
      throw Exception('Failed to login');
    }
  }
}
