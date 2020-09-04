import 'package:coba/Shared/colors.dart';
import 'package:coba/Shared/style.dart';
import 'package:coba/user.dart';
import 'package:flutter/material.dart';
import 'package:coba/Shared/itemShared.dart';
import 'main.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coba/myTask.dart';

void main() => runApp(SignIn());

class SignIn extends StatefulWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    FirebaseUser firebaseUser = await firebaseAuth.signInWithEmailAndPassword(
        email: googleSignInAccount.id,
        password: googleSignInAuthentication.idToken);

    Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) =>
            new MyTask(user: firebaseUser, googleSignIn: googleSignIn)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text('Sign In',
              style: TextStyle(
                  color: Colors.blue, fontFamily: 'poppins', fontSize: 15)),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
                child: Text(
                  'Sign Up',
                ))
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              padding: EdgeInsets.only(right: 18, left: 18),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: h3,
                      ),
                      inputData("Masukan Nama"),
                      inputPassword("Masukan Password"),
                      FlatButton(
                          onPressed: () {},
                          child: Text(
                            'forgot password',
                            style: contrastText,
                          )),
                      RaisedButton(
                        onPressed: () {
                          _signIn();
                        },
                        child: Text("Masuk Melalui GOOGLe"),
                      )
                    ],
                  ),
                  Positioned(
                      bottom: 15,
                      right: -15,
                      child: FlatButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return User();
                            }));
                          },
                          color: primaryColor,
                          padding: EdgeInsets.all(13),
                          shape: CircleBorder(),
                          child: Icon(
                            Icons.arrow_forward,
                            color: white,
                          )))
                ],
              ),
              height: 245,
              width: double.infinity,
              decoration: authPlateDecoration,
            )
          ],
        ),
      ),
    );
  }
}
