class UserDoB {
  final DateTime date;
  final int age;

  UserDoB({
    required this.date,
    required this.age,
  });

  factory UserDoB.fromMap(Map<String, dynamic> e) {
    return UserDoB(
      date: DateTime.parse(e["date"]),
      age: e["age"],
    );
  }
}
