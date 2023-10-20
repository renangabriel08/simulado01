import 'package:flutter/material.dart';
import 'package:simulado/styles/cores.dart';
import 'package:simulado/styles/fonts.dart';

class Roteiro extends StatelessWidget {
  const Roteiro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Tela Roteiro Personalizado',
          style: TextStyle(
            fontFamily: Fonts.fonte,
            color: Cores.verdeEscuro,
          ),
        ),
      ),
    );
  }
}
