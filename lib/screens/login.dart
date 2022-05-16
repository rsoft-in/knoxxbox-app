import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knoxxbox/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FocusNode focusNodePassword;
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  late SharedPreferences sharedPreferences;
  bool _passwordVisible = false;
  bool isBusy = false;

  void _validation() {}

  @override
  void initState() {
    focusNodePassword = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15.0),
            child: ClipRRect(
              child: Image.asset(
                'assets/knoxxbox.png',
                width: 80.0,
              ),
              borderRadius: BorderRadius.circular(40.0),
            ),
          ),
          SizedBox(
            width: 300,
            child: TextField(
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(CupertinoIcons.person),
              ),
              onSubmitted: (value) {
                focusNodePassword.requestFocus();
              },
              controller: _controllerUsername,
            ),
          ),
          kVSpace,
          SizedBox(
            width: 300,
            child: TextField(
              focusNode: focusNodePassword,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(CupertinoIcons.lock),
                suffixIcon: InkWell(
                  borderRadius: BorderRadius.circular(25.0),
                  onTap: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  child: Icon(_passwordVisible
                      ? CupertinoIcons.eye_slash
                      : CupertinoIcons.eye),
                ),
              ),
              onSubmitted: (value) => _validation(),
              controller: _controllerPassword,
            ),
          ),
          kVSpace,
          Container(
            child: isBusy
                ? const CircularProgressIndicator.adaptive()
                : ElevatedButton(
                    onPressed: () => _validation(),
                    child: const Text('Sign-In'),
                  ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              '© Rennovation Software',
              style: TextStyle(fontSize: 12.0),
            ),
          ),
        ]),
      ),
    );
  }
}
