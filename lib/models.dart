import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: UserPage()));
}

class User {
  final String name;
  final String place;

  User({required this.name, required this.place});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["name"],
      place: json["place"],
    );
  }
}

class UserPage extends StatelessWidget {

  final List jsonData = [
    {"name": "John", "place": "Kochi"},
    {"name": "Jerry", "place": "Thrissur"},
    {"name": "Anna", "place": "Calicut"}
  ];

  @override
  Widget build(BuildContext context) {

    List<User> users =
    jsonData.map((e) => User.fromJson(e)).toList();

    return Scaffold(
      appBar: AppBar(title: Text("Users")),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {

          var user = users[index];

          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.place),
          );

        },
      ),
    );
  }
}