import 'dart:convert';
import 'package:testapp/component/user_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CallApiScreen extends StatefulWidget {
  const CallApiScreen({super.key});

  @override
  State<CallApiScreen> createState() => _CallApiScreenState();
}

class _CallApiScreenState extends State<CallApiScreen> {
  User? userData;
  TextEditingController _idSearchController = TextEditingController();
  void fetchUser() async {
    try {
      var response = await http.get(
          Uri.parse('https://dummyjson.com/users/${_idSearchController.text}'));
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        User user = User.fromJson(data);
        setState(() {
          userData = user;
        });
        print('firstName: ${user.firstName}');
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Call API'),
        ),
        body: Center(
            child: Column(children: [
          TextFormField(
            controller: _idSearchController,
            decoration: InputDecoration(labelText: 'ID'),
          ),
          Text('Name : ${userData?.firstName}'),
          Text('Username : ${userData?.username}'),
          Text('Email : ${userData?.email}'),
          ElevatedButton(
              onPressed: () {
                fetchUser();
              },
              child: Text('Call API'))
        ])));
  }
}