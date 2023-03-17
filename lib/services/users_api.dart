import 'package:rests_api/model/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserAPI {
  static Future<List<User>> ambilData() async {
    const String linkAPI = "https://randomuser.me/api/?results=100";
    final response = await http.get(Uri.parse(linkAPI));
    final body = response.body;
    final json = jsonDecode(body);
    final results = json["results"] as List<dynamic>;

    final users = results.map((e) {
      return User.fromMap(e);
    }).toList();
    return users;
  }
}
