import 'package:flutter/material.dart';
import 'package:simulado/styles/cores.dart';
import 'package:simulado/styles/fonts.dart';

class Viajante extends StatelessWidget {
  const Viajante({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Tela Viajante Gamificado',
          style: TextStyle(
            fontFamily: Fonts.fonte,
            color: Cores.verdeEscuro,
          ),
        ),
      ),
    );
  }
}
