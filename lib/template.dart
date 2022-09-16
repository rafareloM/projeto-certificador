import 'dart:io';

import 'package:projeto_certificador/empresa.dart';
import 'package:projeto_certificador/endereco.dart';
import 'package:projeto_certificador/helpers/helper.dart';
import 'package:projeto_certificador/helpers/format.dart';
import 'package:projeto_certificador/helpers/input.dart';

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
    stdout.write('==========================================\n');
    String option = Input.getUserInputNumbers('Selecione uma opção: ');
    switch (option) {
      case '1':
        Empresa empresa = Empresa(
            Endereco(
                Input.getUserInput('Informe o Logradouro: '),
                Input.getUserInputNumbers('Informe o número: '),
                Input.getUserInput('Informe o complemento: '),
                Format.formatCep(Helper.validateNumber(
                    'Informe o CEP(Apenas números): ', 8)),
                Input.getUserInput('Informe o bairro: '),
                Input.getUserInput('Informe o estado: ')),
            Input.getUserInput('Informe o nome fantasia da Empresa: '),
            Format.formatCpf(
                Helper.validateNumber('Infome o CNPJ da Empresa: ', 14)),
            Input.getUserInput('Informe a razão social da Empresa: '),
            Format.formatTelefone(Helper.validateNumber(
                'Informe o Número de Telefone(Apenas números): ', 11)),
            Helper.criarSocio());
        empresasList.add(empresa);
        break;
      case '2':
        print(Helper.pesquisaPorCnpj(empresasList));
        break;
      case '3':
        print(Helper.pesquisaPorDocumento(empresasList));
        break;
      case '4':
        Helper.ordenaRazaoSocial(empresasList);
        empresasList.forEach((element) => print(Empresa.getEmpresa(element)));
        break;
      case '5':
        String id = Input.getUserInput('Infome o ID da Empresa');
        empresasList.removeWhere((element) => element.id == id);
        break;
      case '6':
        stdout.write('Encerrando...');
        condition = false;
        break;
      default:
        stdout.write('Opção inválida! Tente novamente \n');
        break;
    }
  } while (condition);
}
