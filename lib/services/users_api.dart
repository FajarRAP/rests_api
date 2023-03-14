import 'package:rests_api/model/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rests_api/model/user_name.dart';

class UserAPI {
  static Future<List<User>> ambilData() async {
    const String linkAPI = "https://randomuser.me/api/?results=100";
    final response = await http.get(Uri.parse(linkAPI));
    final body = response.body;
    final json = jsonDecode(body);
    final results = json["results"] as List<dynamic>;

    final users = results.map((e) {
      final UserName name = UserName(
          title: e["name"]["title"],
          first: e["name"]["first"],
          last: e["name"]["last"]);
      return User(
          gender: e["gender"],
          email: e["email"],
          phone: e["phone"],
          cell: e["cell"],
          nat: e["nat"],
          name: name);
    }).toList();
    return users;
  }
}
