import 'dart:io';

import 'package:projeto_certificador/empresa.dart';
import 'package:projeto_certificador/input.dart';
import 'package:projeto_certificador/pessoa_fisica.dart';
import 'package:projeto_certificador/pessoa_juridica.dart';
import 'package:projeto_certificador/socio.dart';

void template() {
  List<Empresa> empresasList = [];
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
        Empresa empresa = Empresa();
        empresa.setEmpresa();
        empresasList.add(empresa);
        break;
      case 2:
        print(Empresa.pesquisaPorCnpj(empresasList).first.getEmpresa());
        break;
      case 3:
        print(Empresa.pesquisaPorDocumento(empresasList).first.getEmpresa());
        break;
      case 4:
        empresasList.sort((a, b) => a.razaoSocial.compareTo(b.razaoSocial));
        print(empresasList);
        break;
      case 5:
        String id = Input.getUserInput('Infome o ID da Empresa');
        empresasList.removeWhere((element) => element.id == id);
        break;
      case 6:
        stdout.write('Encerrando...');
        condition = false;
        break;
      default:
        stdout.write('Opção inválida! Tente novamente \n');
        break;
    }
  } while (condition);
}
