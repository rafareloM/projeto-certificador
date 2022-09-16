import 'dart:io';
import 'package:projeto_certificador/empresa.dart';
import 'package:projeto_certificador/endereco.dart';
import 'package:projeto_certificador/helpers/input.dart';
import 'package:projeto_certificador/pessoa_fisica.dart';
import 'package:projeto_certificador/pessoa_juridica.dart';
import 'package:projeto_certificador/socio.dart';

class Helper {
  static String pesquisaPorCnpj(List<Empresa> list) {
    String message;
    String cnpj = validateNumber('Infome o CNPJ: ', 14);
    try {
      Empresa empresaSelecionada = list.where((e) => e.cnpj == cnpj).first;
      message = Empresa.getEmpresa(empresaSelecionada);
    } catch (e) {
      stdout.write('CNPJ não encontrado...\n');
      String option = Input.getUserInput('Gostaria de tentar de novo?(S/N)');

      option.toLowerCase() == 's'
          ? message = pesquisaPorCnpj(list)
          : message = '';
    }
    return message;
  }

  static String validateNumber(String message, int lenght) {
    String number = Input.getUserInputNumbers(message);
    if (number.toString().length != lenght) {
      stdout.write('Tamanho do número errado!\n');
      number = validateNumber(message, lenght);
    }
    return number;
  }

  static void ordenaRazaoSocial(List<Empresa> list) {
    list.sort((a, b) =>
        (a.nomeFantasia.toLowerCase().compareTo(b.nomeFantasia.toLowerCase())));
  }

  static String pesquisaPorDocumento(List<Empresa> list) {
    final Empresa empresaSelecionada;
    String message = '';
    String documento =
        Input.getUserInputNumbers('Insira o número de CPF/CNPJ do sócio: ');
    if (documento.toString().length == 11) {
      empresaSelecionada =
          list.where((e) => e.socio.documento == documento).single;
      return message = Empresa.getEmpresa(empresaSelecionada);
    }
    if (documento.toString().length == 14) {
      empresaSelecionada =
          list.where((e) => e.socio.documento == documento).single;
      return message = Empresa.getEmpresa(empresaSelecionada);
    }
    stdout.write('CPF/CNPJ Inválido\n');
    message = pesquisaPorDocumento(list);
    return message;
  }

  static Socio criarSocio() {
    Socio socio;
    String option = Input.getUserInputNumbers(
        '========================\nCadastrando Socio:\n========================\nPara pessoa física digite: 1\nPara pesoa jurídica digite: 2\nSua opção: ');
    if (option == '1') {
      socio = PessoaFisica(
        Endereco(
            Input.getUserInput('Informe o Logradouro do Sócio: '),
            Input.getUserInputNumbers('Informe o número: '),
            Input.getUserInput('Informe o complemento: '),
            Helper.validateNumber('Informe o CEP(Apenas números): ', 8),
            Input.getUserInput('Informe o bairro: '),
            Input.getUserInput('Informe o estado: ')),
        Input.getUserInput('Informe o nome completo: '),
        validateNumber('Infome o CPF: ', 11),
      );
    } else if (option == '2') {
      socio = PessoaJuridica(
        Endereco(
            Input.getUserInput('Informe o Logradouro do Sócio: '),
            Input.getUserInputNumbers('Informe o número: '),
            Input.getUserInput('Informe o complemento: '),
            Helper.validateNumber('Informe o CEP(Apenas números): ', 8),
            Input.getUserInput('Informe o bairro: '),
            Input.getUserInput('Informe o estado: ')),
        Input.getUserInput('Informe o nome fantasia: '),
        validateNumber('Infome o CNPJ do Sócio: ', 14),
        Input.getUserInput('Informe a razão social: '),
      );
    } else {
      stdout.write('Opção inválida! Tente novamente \n');
      socio = criarSocio();
    }
    return socio;
  }

  static void endOfOption() {
    stdout.write('Pressione Enter para continuar....');
    stdin.readLineSync();
  }

  static void removePorId(List<Empresa> list) {
    String id = Input.getUserInput('Infome o ID da Empresa: ');
    if (list.any((element) => element.id == id)) {
      list.removeWhere((element) => element.id == id);
      stdout.write('Removido com Sucesso!\n');
      return;
    }
    stdout.write('ID não encontrado...\n');
    String option = Input.getUserInput('Gostaria de tentar de novo?(S/N)');
    if (option.toLowerCase() == 's') removePorId(list);
  }

  static criarEmpresas(List<Empresa> list) {
    stdout.write(
        '========================\nCadastrando nova empresa\n========================\n');
    Empresa empresa = Empresa(
      Endereco(
        Input.getUserInput('Informe o Logradouro Da Empresa: '),
        Input.getUserInputNumbers('Informe o número: '),
        Input.getUserInput('Informe o complemento: '),
        Helper.validateNumber('Informe o CEP(Apenas números): ', 8),
        Input.getUserInput('Informe o bairro: '),
        Input.getUserInput('Informe o estado: '),
      ),
      Input.getUserInput('Informe o nome fantasia da Empresa: '),
      Helper.validateNumber('Infome o CNPJ da Empresa: ', 14),
      Input.getUserInput('Informe a razão social da Empresa: '),
      Helper.validateNumber(
          'Informe o Número de Telefone(Apenas números): ', 11),
      Helper.criarSocio(),
    );
    list.add(empresa);
    String continuar =
        Input.getUserInput('Gostaria de registrar outra empresa?(S/N)');
    if (continuar == 's') {
      criarEmpresas(list);
    }
  }
}
