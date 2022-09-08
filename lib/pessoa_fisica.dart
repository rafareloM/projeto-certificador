import 'dart:io';

import 'package:projeto_certificador/input.dart';
import 'package:projeto_certificador/socio.dart';

class PessoaFisica extends Socio {
  late String _cpf;
  late String _nomeFantasia;
  static String formatCpf(String cpf) {
    String parsedCpf = cpf.toString();
    return '${parsedCpf.substring(0, 3)}.${parsedCpf.substring(3, 6)}.${parsedCpf.substring(6, 9)}-${parsedCpf.substring(9)}';
  }

  static String validaCpf() {
    String cpf =
        Input.getUserInputToIntPossibleZero('Informe o CPF (Apenas números): ');
    while (cpf.toString().length != 11) {
      stdout.write('CPF inválido!\n');
      cpf = Input.getUserInputToIntPossibleZero(
          'Informe o CPF (Apenas números): ');
    }
    return formatCpf(cpf);
  }

  @override
  void setDocumento() {
    _cpf = validaCpf();
  }

  @override
  String get documento => _cpf;

  @override
  void setNome() {
    _nomeFantasia = Input.getUserInput('Informe o Nome Completo: ');
  }

  @override
  String get nome => _nomeFantasia;

  @override
  setSocio() {
    setNome();
    setDocumento();
    endereco.setEndereco('do Sócio');
  }

  @override
  String getSocio() {
    return 'Sócio:\nCPF: $documento\nNome Completo: $nome\nEndereço: ${super.endereco.getEndereco()}';
  }
}
