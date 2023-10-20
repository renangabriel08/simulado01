import 'package:flutter/material.dart';
import 'package:simulado/styles/cores.dart';
import 'package:simulado/styles/fonts.dart';

class Configs extends StatelessWidget {
  const Configs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Tela Configurações de Usuário',
          style: TextStyle(
            fontFamily: Fonts.fonte,
            color: Cores.verdeEscuro,
          ),
        ),
      ),
    );
  }
}
