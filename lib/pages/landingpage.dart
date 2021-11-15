import 'package:easy_trading/Login%20and%20Signup/loginpage.dart';
import 'package:easy_trading/pages/navigation.dart';
import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          FirebaseUser user = snapshot.data;
          if (user == null) {
            return LoginScreen();
          }
          return NavigationBar();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
