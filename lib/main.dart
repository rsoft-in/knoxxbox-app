import 'package:flutter/material.dart';
import 'package:knoxxbox/screens/splash.dart';
import 'package:knoxxbox/theme.dart';
import 'package:yaru/yaru.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: yaruLight,
      darkTheme: yaruDark,
      home: const SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
