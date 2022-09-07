import 'dart:io';

import 'package:projeto_certificador/empresa.dart';
import 'package:projeto_certificador/input.dart';

void template() {
  bool condition = true;
  do {
    stdout.write('========== Registro de Empresas ==========\n');
    stdout.write('1.Cadastrar uma nova empresa;\n');
    stdout.write('2.Buscar Empresa cadastrada por CNPJ;\n');
    stdout.write('3.Buscar Empresa por CPF/CNPJ do Sócio;\n');
    stdout.write(
        '4.Listar Empresas cadastradas em ordem alfabética (baseado na Razão Social);\n');
    stdout.write('5.Excluir uma empresa (por ID);\n');
    stdout.write('6.Sair\n');
    int option = Input.getUserInputToInt('Selecione uma opção: ');
    switch (option) {
      case 1:
        var empresa = Empresa();
        empresa.endereco.setEndereco();
        print(empresa.endereco.getEndereco());
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        stdout.write('Encerrando...');
        condition = false;
        break;
    }
  } while (condition);
}
