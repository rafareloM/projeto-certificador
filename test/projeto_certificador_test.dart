import 'dart:convert';
import 'dart:io';

import 'package:projeto_certificador/empresa.dart';
import 'package:projeto_certificador/endereco.dart';
import 'package:projeto_certificador/helpers/helper.dart';
import 'package:projeto_certificador/helpers/input.dart';
import 'package:projeto_certificador/pessoa_fisica.dart';
import 'package:projeto_certificador/socio.dart';
import 'package:projeto_certificador/template.dart';

void main() {
  List<Empresa> empresasList = [];
  Empresa empresa = Empresa(
    Endereco(
      Input.getUserInput('logradouro: '),
      'ã',
      'ã',
      '12345678',
      'ã',
      'ã',
    ),
    'ã',
    '12345678901234',
    'ã',
    '81987654321',
    PessoaFisica(
        Endereco(
          'â',
          'â',
          'Â',
          '12345678',
          'A',
          'A',
        ),
        'â',
        '12345678901'),
  );
  empresasList.add(empresa);
  Helper.ordenaRazaoSocial(empresasList);
  empresasList.forEach((element) => stdout.write(Empresa.getEmpresa(element)));
  stdout.write(empresasList.first.endereco.logradouro);
  String? nome = stdin.readLineSync(encoding: Encoding.getByName('UTF-8')!);
  print(Encoding.getByName('UTF-8').runtimeType);
  print("Nome informado:$nome");
}
