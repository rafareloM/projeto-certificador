import 'dart:io';

import 'package:projeto_certificador/endereco.dart';
import 'package:projeto_certificador/input.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Empresa {
  final _id = uuid.v4();
  final _dataCriacao = DateTime.now();
  late String _telefone;
  late String _razaoSocial;
  late String _nomeFantasia;
  Endereco endereco = Endereco();

  static String formatTelefone(int telefone) {
    String parsedTelefone = telefone.toString();
    return '(${parsedTelefone.substring(0, 2)}) ${parsedTelefone.substring(2, 3)} ${parsedTelefone.substring(3, 7)}-${parsedTelefone.substring(7)}';
  }

  static String validaTelefone() {
    int cep = Input.getUserInputToInt(
        'Informe o Número de Telefone(ex.: 81987654321): ');
    while (cep.toString().length != 11) {
      print(cep.toString().length);
      stdout.write('Número de Telefone inválido\n');
      cep = Input.getUserInputToInt(
          'Informe o Número de Telefone(ex.: 81987654321): ');
    }
    return formatTelefone(cep);
  }

  void setTelefone() {
    _telefone = validaTelefone();
  }

  get telefone {
    return _telefone;
  }

  get id {
    return _id;
  }

  get dataCriacao {
    return _dataCriacao;
  }

  void setRazaoSocial() {
    _razaoSocial = Input.getUserInput('Informe o razaoSocial: ');
  }

  get razaoSocial {
    return _razaoSocial;
  }

  void setNomeFantasia() {
    _nomeFantasia = Input.getUserInput('Informe o nomeFantasia: ');
  }

  get nomeFantasia {
    return _nomeFantasia;
  }
}
