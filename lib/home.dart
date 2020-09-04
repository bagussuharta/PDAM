import 'package:flutter/material.dart';

void main() => runApp(MyHomeApp());

class MyHomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
                appBar: AppBar(
                  title: Text("Home"),
                  bottom: TabBar(tabs: [
                    Tab(
                      icon: Icon(Icons.home),
                    ),
                    Tab(
                      icon: Icon(Icons.book),
                    ),
                    Tab(
                      icon: Icon(Icons.check),
                    ),
                    Tab(
                      text: "News",
                    )
                  ]),
                ),
                body: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      DrawerHeader(
                        child: Text(""),
                        decoration: BoxDecoration(color: Colors.blue),
                      ),
                      ListTile(
                        title: IconButton(
                            icon: Icon(Icons.add_to_photos), onPressed: () {}),
                      )
                    ],
                  ),
                ))));
  }
}
