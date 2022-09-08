import 'dart:io';

import 'package:projeto_certificador/input.dart';
import 'package:projeto_certificador/socio.dart';

class PessoaJuridica extends Socio {
  late String _razaoSocial;
  @override
  void setNome() {
    nome = Input.getUserInput('Informe o Nome Fantasia: ');
  }

  static String validaCnpj([String message = '']) {
    String cnpj = Input.getUserInputToIntPossibleZero(
        'Informe o CNPJ $message(Apenas números): ');
    if (cnpj.toString().length != 14) {
      stdout.write('CNPJ inválido!\n');
      cnpj = validaCnpj(message);
    }
    return formatCnpj(cnpj);
  }

  static String formatCnpj(String cnpj) {
    String parsedCnpj = cnpj.toString();
    return '${parsedCnpj.substring(0, 2)}.${parsedCnpj.substring(2, 5)}.${parsedCnpj.substring(5, 8)}/${parsedCnpj.substring(8, 12)}-${parsedCnpj.substring(12)}';
  }

  void setRazaoSocial() {
    _razaoSocial = Input.getUserInput('Informe a Razão Social do Sócio: ');
  }

  get razaoSocial {
    return _razaoSocial;
  }

  @override
  void setDocumento() {
    documento = validaCnpj('do Sócio');
  }

  @override
  void setSocio() {
    setNome();
    setRazaoSocial();
    setDocumento();
    endereco.setEndereco('do Sócio');
  }

  @override
  String getSocio() {
    return 'Sócio:\nCPF: $documento\nRazão Social: $razaoSocial\nNome Fantasia: $nome\nEndereço: ${endereco.getEndereco()}';
  }
}
