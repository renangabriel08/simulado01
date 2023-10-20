import 'package:flutter/material.dart';
import 'package:simulado/pages/app.dart';
import 'package:simulado/pages/configs.dart';
import 'package:simulado/pages/roteiro.dart';
import 'package:simulado/pages/viajante.dart';
import 'package:simulado/styles/cores.dart';
import 'package:simulado/styles/fonts.dart';

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
  int pg = 0;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Cores.verdeEscuro,
        title: Text(
          'EUVOUNATRIP',
          style: TextStyle(fontFamily: Fonts.fonte),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: Cores.verdeEscuro,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(999),
                    child: Image.network(
                      args.img,
                      height: 100,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        args.nome,
                        style: TextStyle(
                          fontFamily: Fonts.fonte,
                          color: Colors.white,
                          fontSize: Fonts.fontSubtitulo,
                        ),
                      ),
                      Text(
                        args.email,
                        style: TextStyle(
                          fontFamily: Fonts.fonte,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ListTile(
                  onTap: () => setState(() {
                    pg = 0;
                    Navigator.pop(context);
                  }),
                  leading: Icon(
                    Icons.home,
                    color: Cores.verdeEscuro,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(
                      fontFamily: Fonts.fonte,
                      color: Cores.verdeEscuro,
                      fontSize: Fonts.fontPadrao,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () => setState(() {
                    pg = 1;
                    Navigator.pop(context);
                  }),
                  leading: Icon(
                    Icons.public,
                    color: Cores.verdeEscuro,
                  ),
                  title: Text(
                    'Roteiro personalizado',
                    style: TextStyle(
                      fontFamily: Fonts.fonte,
                      color: Cores.verdeEscuro,
                      fontSize: Fonts.fontPadrao,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () => setState(() {
                    pg = 2;
                    Navigator.pop(context);
                  }),
                  leading: Icon(
                    Icons.card_travel,
                    color: Cores.verdeEscuro,
                  ),
                  title: Text(
                    'Viajante gameficado',
                    style: TextStyle(
                      fontFamily: Fonts.fonte,
                      color: Cores.verdeEscuro,
                      fontSize: Fonts.fontPadrao,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () => setState(() {
                    pg = 3;
                    Navigator.pop(context);
                  }),
                  leading: Icon(
                    Icons.settings,
                    color: Cores.verdeEscuro,
                  ),
                  title: Text(
                    'Configurações',
                    style: TextStyle(
                      fontFamily: Fonts.fonte,
                      color: Cores.verdeEscuro,
                      fontSize: Fonts.fontPadrao,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () => setState(() {
                    pg = 0;
                    Navigator.pushNamed(context, '/login');
                  }),
                  leading: Icon(
                    Icons.logout,
                    color: Cores.verdeEscuro,
                  ),
                  title: Text(
                    'Sair',
                    style: TextStyle(
                      fontFamily: Fonts.fonte,
                      color: Cores.verdeEscuro,
                      fontSize: Fonts.fontPadrao,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: IndexedStack(
        index: pg,
        children: [
          App(),
          Roteiro(),
          Viajante(),
          Configs(),
        ],
      ),
    );
  }
}
