import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:simulado/pages/home.dart';
import 'package:simulado/widgets/toast.dart';

class Biometria {
  static validarBiometria(context) async {
    int erros = 0;
    int id = 0;

    try {
      final LocalAuthentication auth = LocalAuthentication();
      final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;

      if (canAuthenticateWithBiometrics && id == 0) {
        final bool didAuthenticate = await auth.authenticate(
          localizedReason: 'Autentique utilizando sua digital',
          options: const AuthenticationOptions(biometricOnly: true),
        );
        if (didAuthenticate) {
          Navigator.pushNamed(
            context,
            Home.routeName,
            arguments: ScreenArguments(
              '12',
              'teste',
              'teste@gmail.com',
            ),
          );
        } else {
          erros++;
          if (erros == 3) {
            id = 1;
            await auth.stopAuthentication();
            MyToast.gerarToast('Login por digital cancelado');
          }
        }
      }
    } catch (e) {
      MyToast.gerarToast('Erro ao carregar digital');
    }
  }
}
