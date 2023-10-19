class Validator {
  static validarDados(String value) {
    if (value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }
}
