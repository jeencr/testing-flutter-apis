import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(home: ProfilePage()));
}

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List profiles = [];

  Future getData() async {
    var response = await http.get(
      Uri.parse("https://my-json-server.typicode.com/jeencr/json-db-api-call/profile"),
    );

    setState(() {
      profiles = jsonDecode(response.body);
      print(profiles);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profiles")),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          var user = profiles[index];

          return ListTile(
            title: Text(user["name"]),
            subtitle: Text(user["place"]),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user['image']),
            ),
          );
        },
      ),

      
      floatingActionButton: ElevatedButton(
        onPressed: getData,
        child: Text("Refresh"),
      ),
    );
  }
}