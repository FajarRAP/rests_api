import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rests_api/model/user.dart';
import 'package:rests_api/services/users_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    ambilData();
  }

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
          Color warnaBGTile =
              (user.gender == "male") ? Colors.blueGrey : Colors.pinkAccent;
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                user.picture.thumbnail,
              ),
            ),
            title: Text(user.fullName),
            subtitle: Text(user.email),
            tileColor: warnaBGTile,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ambilData,
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }

  Future<void> ambilData() async {
    final hasil = await UserAPI.ambilData();
    setState(() {
      users = hasil;
    });
  }
}
