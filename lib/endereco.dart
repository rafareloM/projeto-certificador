import 'dart:io';

import 'package:projeto_certificador/input.dart';

class Endereco {
  late String _logradouro;
  late num _numero;
  late String _complemento;
  late String _bairro;
  late String _estado;
  late String _cep;
  String formatCep(int cep) {
    String parsedCep = cep.toString();
    return '${parsedCep.substring(0, 2)}-${parsedCep.substring(5)}';
  }

  String validaCep() {
    int cep = Input.getUserInputToInt('Informe o CEP: ');
    while (cep.toString().length != 8) {
      stdout.write('CEP inválido\n');
      cep = Input.getUserInputToInt('Informe o CEP: ');
    }
    return formatCep(cep);
  }

  void setLogradouro() {
    _logradouro = Input.getUserInput('Informe o Logradouro: ');
  }

  get logradouro {
    return _logradouro;
  }

  void setNumero() {
    _numero = Input.getUserInputToInt('Informe o número: ');
  }

  get numero {
    return _numero;
  }

  void setComplemento() {
    _complemento = Input.getUserInput('Informe o complemento: ');
  }

  get complemento {
    return _complemento;
  }

  void setBairro() {
    _bairro = Input.getUserInput('Informe o bairro: ');
  }

  get bairro {
    return _bairro;
  }

  void setEstado() {
    _estado = Input.getUserInput('Informe o estado(ex.: PE): ');
  }

  get estado {
    return _estado;
  }

  void setCep() {
    _cep = validaCep();
  }

  get cep {
    return _cep;
  }

  setEndereco() {
    setLogradouro();
    setNumero();
    setComplemento();
    setBairro();
    setEstado();
    setCep();
  }

  String getEndereco() {
    return 'Endereço: $logradouro, $numero, $complemento, $bairro/$estado, $cep';
  }
}
