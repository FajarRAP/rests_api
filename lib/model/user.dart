import 'package:rests_api/model/user_dob.dart';
import 'package:rests_api/model/user_location.dart';
import 'package:rests_api/model/user_name.dart';
import 'package:rests_api/model/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDoB dob;
  final UserLocation location;
  final UserPicture picture;
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
    required this.picture,
  });
  factory User.fromMap(Map<String, dynamic> e) {
    final UserName name = UserName.fromMap(e["name"]);
    final UserDoB dob = UserDoB.fromMap(e["dob"]);

    final UserLocation location = UserLocation.fromMap(e["location"]);
    final UserPicture picture = UserPicture.fromMap(e["picture"]);
    return User(
      gender: e["gender"],
      email: e["email"],
      phone: e["phone"],
      cell: e["cell"],
      nat: e["nat"],
      name: name,
      dob: dob,
      location: location,
      picture: picture,
    );
  }
  String get fullName => "${name.title}. ${name.first} ${name.last}";
}
