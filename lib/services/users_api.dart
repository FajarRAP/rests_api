import 'package:rests_api/model/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rests_api/model/user_dob.dart';
import 'package:rests_api/model/user_location.dart';
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
      final UserDoB dob =
          UserDoB(date: DateTime.parse(e["dob"]["date"]), age: e["dob"]["age"]);
      final UserLocation location = UserLocation(
        city: e["location"]["city"],
        state: e["location"]["state"],
        country: e["location"]["country"],
        postcode: e["location"]["postcode"].toString(),
        street: LocationStreet(
            number: e["location"]["street"]["number"].toString(),
            name: e["location"]["street"]["name"]),
        coordinates: LocationCoordinates(
            latitude: e["location"]["coordinates"]["latitude"],
            longitude: e["location"]["coordinates"]["longitude"]),
        timezone: LocationTimezone(
            offset: e["location"]["timezone"]["offset"],
            description: e["location"]["timezone"]["description"]),
      );
      return User(
        gender: e["gender"],
        email: e["email"],
        phone: e["phone"],
        cell: e["cell"],
        nat: e["nat"],
        name: name,
        dob: dob,
        location: location,
      );
    }).toList();
    return users;
  }
}
