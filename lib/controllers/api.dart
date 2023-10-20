import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:simulado/pages/home.dart';
import 'package:simulado/widgets/toast.dart';

class Api {
  static logar(String email, String senha, context) async {
    try {
      final url = Uri.parse(
        'https://apieuvounatrip.azurewebsites.net/api/Usuarios/Login?email=$email&senha=$senha',
      );
      final req = await http.post(url);

      if (req.statusCode == 200) {
        final res = jsonDecode(utf8.decode(req.bodyBytes));
        final token = res['token'];
        Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

        Navigator.pushNamed(
          context,
          Home.routeName,
          arguments: ScreenArguments(
            decodedToken['fotoPerfil'],
            decodedToken['name'],
            email,
          ),
        );
      } else {
        MyToast.gerarToast('Erro ao logar');
      }
    } catch (e) {
      MyToast.gerarToast('Erro ao logar');
    }
  }
}
