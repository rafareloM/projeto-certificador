import 'dart:io';

import 'package:projeto_certificador/input.dart';

class Endereco {
  late String _logradouro;
  late num _numero;
  late String _complemento;
  late String _bairro;
  late String _estado;
  late String _cep;
  String formatCep(String cep) {
    String parsedCep = cep.toString();
    return '${parsedCep.substring(0, 2)}-${parsedCep.substring(2)}';
  }

  String validaCep(String message) {
    String cep = Input.getUserInputToIntPossibleZero(
        'Informe o CEP $message(Apenas números): ');
    while (cep.toString().length != 8) {
      stdout.write('CEP inválido!\n');
      cep = Input.getUserInputToIntPossibleZero(
          'Informe o CEP (Apenas números): ');
    }
    return formatCep(cep);
  }

  void setLogradouro(String message) {
    _logradouro = Input.getUserInput('Informe o Logradouro $message: ');
  }

  get logradouro {
    return _logradouro;
  }

  void setNumero() {
    _numero = Input.getUserInputToInt('Informe o número do Logradouro: ');
  }

  get numero {
    return _numero;
  }

  void setComplemento() {
    _complemento = Input.getUserInput('Informe o complemento : ');
  }

  get complemento {
    return _complemento;
  }

  void setBairro(String message) {
    _bairro = Input.getUserInput('Informe o bairro $message: ');
  }

  get bairro {
    return _bairro;
  }

  void setEstado(String message) {
    _estado = Input.getUserInput('Informe o estado $message(ex.: PE): ');
  }

  get estado {
    return _estado;
  }

  void setCep(String message) {
    _cep = validaCep(message);
  }

  get cep {
    return _cep;
  }

  setEndereco(String message) {
    setLogradouro(message);
    setNumero();
    setComplemento();
    setBairro(message);
    setEstado(message);
    setCep(message);
  }

  String getEndereco() {
    return 'Endereço: $logradouro, $numero, $complemento, $bairro/$estado, $cep';
  }
}
