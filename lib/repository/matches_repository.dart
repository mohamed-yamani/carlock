import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<List> getMathesFromWe() async {
    var myUrl = Uri.parse("https://matricule.icebergtech.net/api/match/");

    http.Response response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
      "authorization": "Bearer " + "babcc1fef4eada4129bc0976367ffaba84a30fb8",
    });

    String source = Utf8Decoder().convert(response.bodyBytes);
    print(json.decode(source));

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      final token = responseJson['token'];
      return json.decode(source);
    } else {
      throw Exception('Failed to login');
      return [];
    }
  }
}
