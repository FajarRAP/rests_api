import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rests_api/model/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pemanggilan REST API"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(
                "${user.name.title}. ${user.name.first} ${user.name.last}"),
            subtitle: Text(user.email),
            tileColor:
                (user.gender == "male") ? Colors.blueGrey : Colors.pinkAccent,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ambilData,
      ),
    );
  }

  void ambilData() async {
    print("Data diambil");
    const String linkAPI = "https://randomuser.me/api/?results=100";
    final response = await http.get(Uri.parse(linkAPI));
    final body = response.body;
    final json = jsonDecode(body);
    final results = json["results"] as List<dynamic>;
    setState(() {
      users = results.map((e) {
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
    });
    print("Pengambilan selesai");
  }
}
