import 'package:flutter/material.dart';
import 'package:simulado/styles/cores.dart';
import 'package:simulado/styles/fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Home',
          style: TextStyle(
            fontFamily: Fonts.fonte,
            color: Cores.verdeEscuro,
          ),
        ),
      ),
    );
  }
}
