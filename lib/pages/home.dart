import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class ScreenArguments {
  final String img;
  final String nome;
  final String email;

  ScreenArguments(this.img, this.nome, this.email);
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Container();
  }
}
