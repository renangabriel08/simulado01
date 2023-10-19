import 'package:flutter/material.dart';
import 'package:simulado/controllers/api.dart';
import 'package:simulado/controllers/biometria.dart';
import 'package:simulado/controllers/validator.dart';
import 'package:simulado/styles/cores.dart';
import 'package:simulado/styles/fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? senha;

  bool obTxt = true;
  IconData icone = Icons.visibility;

  toggleSenha() {
    setState(() {
      if (obTxt) {
        obTxt = false;
        icone = Icons.visibility_off;
      } else {
        obTxt = true;
        icone = Icons.visibility;
      }
    });
  }

  @override
  void initState() {
    Biometria.validarBiometria(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * .3,
              width: width,
              decoration: BoxDecoration(
                color: Cores.verdeEscuro,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset('assets/images/icon.png'),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Entre em nosso aplicativo e transforme suas jornadas em aventuras emocionantes e personalizadas',
                        style: TextStyle(
                          fontFamily: Fonts.fonte,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: (height * .7) - 40,
                width: width,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: Fonts.fonte,
                          fontSize: Fonts.fontSubtitulo,
                          color: Cores.verdeEscuro,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        onChanged: (value) => email = value,
                        validator: (value) => Validator.validarDados(email!),
                        decoration: InputDecoration(
                          label: const Text('Email'),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.email_outlined),
                            onPressed: () {},
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        onChanged: (value) => senha = value,
                        validator: (value) => Validator.validarDados(senha!),
                        obscureText: obTxt,
                        decoration: InputDecoration(
                          label: const Text('Senha'),
                          suffixIcon: IconButton(
                            icon: Icon(icone),
                            onPressed: () => toggleSenha(),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Api.logar(email!, senha!, context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(width, 50),
                          backgroundColor: Cores.verdeEscuro,
                        ),
                        child: Text(
                          'Acessar',
                          style: TextStyle(
                            fontFamily: Fonts.fonte,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
