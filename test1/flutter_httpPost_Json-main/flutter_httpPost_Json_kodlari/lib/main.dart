import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:odev3/userModel.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Odev3",
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

Future<UserModel> createUser(String firstname, String lastname, String telefon,
    String sifre, String sifre2, String email) async {
  final String url = "https://heptakas.com/api/account/register";

  var json = {
    'first_name': firstname,
    'last_name': lastname,
    'telefon': telefon,
    'email': email,
    'password': sifre,
    'password2': sifre2,
  };

  print(json);

  var response = await http.post(
    url,
    body: jsonEncode(json),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  print(response);

  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print("başarısız");
  }

  return UserModel.fromJson(json);
}

class _AnaSayfaState extends State<AnaSayfa> {
  UserModel userr;
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController telefonController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController sifreController = TextEditingController();
  final TextEditingController sifre2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: firstnameController,
            ),
            TextField(
              controller: lastnameController,
            ),
            TextField(
              controller: telefonController,
            ),
            TextField(
              controller: emailController,
            ),
            TextField(
              controller: sifreController,
            ),
            TextField(
              controller: sifre2Controller,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String firstname = firstnameController.text;
          final String lastname = lastnameController.text;
          final String telefon = telefonController.text;
          final String email = emailController.text;
          final String sifre = sifreController.text;
          final String sifre2 = sifre2Controller.text;

          final UserModel user = await createUser(
              firstname, lastname, telefon, email, sifre, sifre2);

          setState(() {
            userr = user;
          });
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
