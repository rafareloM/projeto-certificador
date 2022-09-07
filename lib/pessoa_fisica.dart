import 'dart:io';

import 'package:projeto_certificador/input.dart';
import 'package:projeto_certificador/socio.dart';

class PessoaFisica extends Socio {
  late String _cpf;
  String formatCpf(int cpf) {
    String parsedCpf = cpf.toString();
    return '${parsedCpf.substring(0, 3)}.${parsedCpf.substring(3, 6)}.${parsedCpf.substring(6, 9)}-${parsedCpf.substring(9)}';
  }

  String validaCpf() {
    int cpf = Input.getUserInputToInt('Informe o CPF (ex.: 48706525016): ');
    while (cpf.toString().length != 11) {
      stdout.write('CPF inválido\n');
      cpf = Input.getUserInputToInt('Informe o CPF (ex.: 48706525016): ');
    }
    return formatCpf(cpf);
  }

  void setCpf() {
    _cpf = validaCpf();
  }

  get cpf {
    return _cpf;
  }

  @override
  void setNome() {
    nome = Input.getUserInput('Informe o Nome Completo: ');
  }

  @override
  String getSocio() {
    return 'Sócio:\nCPF: $cpf\nNome Completo: $nome\nEndereço: ${endereco.getEndereco()}';
  }
}
