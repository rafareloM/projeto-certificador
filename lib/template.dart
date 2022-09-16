import 'dart:io';

import 'package:projeto_certificador/empresa.dart';
import 'package:projeto_certificador/helpers/helper.dart';
import 'package:projeto_certificador/helpers/input.dart';

void template(List<Empresa> empresasList) {
  bool condition = true;
  do {
    stdout.write('========== Registro de Empresas ==========\n');
    stdout.write('1.Cadastrar uma nova empresa;\n');
    stdout.write('2.Buscar Empresa cadastrada por CNPJ;\n');
    stdout.write('3.Buscar Empresa por CPF/CNPJ do Sócio;\n');
    stdout.write(
        '4.Listar Empresas cadastradas em ordem alfabética(baseado na Razão Social);\n');
    stdout.write('5.Excluir uma empresa(por ID);\n');
    stdout.write('6.Sair\n');
    stdout.write('==========================================\n');
    String option = Input.getUserInputNumbers('Selecione uma opção: ');
    switch (option) {
      case '1':
        Helper.criarEmpresas(empresasList);
        break;
      case '2':
        print(Helper.pesquisaPorCnpj(empresasList));
        Helper.endOfOption();
        break;
      case '3':
        print(Helper.pesquisaPorDocumento(empresasList));
        Helper.endOfOption();

        break;
      case '4':
        Helper.ordenaRazaoSocial(empresasList);
        empresasList
            .forEach((element) => stdout.write(Empresa.getEmpresa(element)));
        Helper.endOfOption();

        break;
      case '5':
        Helper.removePorId(empresasList);
        Helper.endOfOption();
        break;
      case '6':
        stdout.write('Encerrando...');
        condition = false;
        break;
      default:
        stdout.write('Opção inválida! Tente novamente \n');
        Helper.endOfOption();
        break;
    }
  } while (condition);
}
