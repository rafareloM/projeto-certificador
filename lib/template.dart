import 'dart:io';

import 'package:projeto_certificador/empresa.dart';
import 'package:projeto_certificador/endereco.dart';
import 'package:projeto_certificador/helper.dart';

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
    String option = Helper.getUserInputNumbers('Selecione uma opção: ');
    switch (option) {
      case '1':
        Empresa empresa = Empresa(
            Endereco(
                Helper.getUserInput('Informe o Logradouro: '),
                Helper.getUserInputNumbers('Informe o número: '),
                Helper.getUserInput('Informe o complemento: '),
                Helper.formatCep(Helper.validateNumber(
                    'Informe o CEP(Apenas números): ', 8)),
                Helper.getUserInput('Informe o bairro: '),
                Helper.getUserInput('Informe o estado: ')),
            Helper.getUserInput('Informe o nome fantasia da Empresa: '),
            Helper.formatCpf(
                Helper.validateNumber('Infome o CNPJ da Empresa: ', 14)),
            Helper.getUserInput('Informe a razão social da Empresa: '),
            Helper.formatTelefone(Helper.validateNumber(
                'Informe o Número de Telefone(Apenas números): ', 11)),
            Helper.criarSocio());
        empresasList.add(empresa);
        break;
      case '2':
        print(Helper.pesquisaPorCnpj(empresasList));
        break;
      case '3':
        print(
            Helper.getEmpresa(Helper.pesquisaPorDocumento(empresasList).first));
        break;
      case '4':
        empresasList.sort((a, b) => (a.razaoSocial.compareTo(b.razaoSocial)));
        print(empresasList);
        break;
      case '5':
        String id = Helper.getUserInput('Infome o ID da Empresa');
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
