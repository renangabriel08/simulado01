import 'package:flutter/material.dart';
import 'package:simulado/pages/home.dart';
import 'package:simulado/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const Login(),
        Home.routeName: (context) => const Home(),
      },
      initialRoute: '/login',
    );
  }
}
