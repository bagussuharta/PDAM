import 'package:coba/Shared/colors.dart';
import 'package:coba/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(User());

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: new AppBar(
          centerTitle: mounted,
          title: Text("USER"),
          backgroundColor: blue,
          leading: new IconButton(
              icon: new Icon(Icons.home),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyHomeApp();
                }));
              }),
          actions: [new Image.asset("assets/images/favicon.png")],
        ),
      ),
    );
  }
}
