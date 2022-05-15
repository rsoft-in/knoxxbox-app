import 'dart:async';

import 'package:flutter/material.dart';
import 'package:knoxxbox/constants.dart';
import 'package:knoxxbox/screens/app.dart';
import 'package:knoxxbox/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SharedPreferences sharedPreferences;
  bool isSignedIn = false;

  getCredential() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      isSignedIn = sharedPreferences.getBool("is_regtool_logged") ?? false;

      if (!isSignedIn) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => const LoginPage()),
            (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => const KnoxxboxApp()),
            (Route<dynamic> route) => false);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => getCredential());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              child: Image.asset(
                'assets/knoxxbox.png',
                width: 80.0,
              ),
              borderRadius: BorderRadius.circular(50.0),
            ),
            kVSpace,
            const Text(
              kAppName,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
      ),
    );
  }
}
