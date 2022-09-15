import 'dart:io';
import 'package:projeto_certificador/empresa.dart';
import 'package:projeto_certificador/endereco.dart';
import 'package:projeto_certificador/pessoa_fisica.dart';
import 'package:projeto_certificador/pessoa_juridica.dart';
import 'package:projeto_certificador/socio.dart';

class Helper {
  static String getUserInput(String message) {
    String? userInput;
    stdout.write(message);
    userInput = stdin.readLineSync();
    if (userInput == null || userInput == '') {
      stdout.write('Entrada invalida!\n');
      userInput = getUserInput(message);
    }
    return userInput;
  }

  static String getUserInputNumbers(String message) {
    late String userInput;
    // ignore: unused_local_variable
    int inputInt;
    userInput = (getUserInput(message));
    try {
      inputInt = int.parse(userInput);
    } catch (e) {
      stdout.write('Número inválido!\n');
      userInput = getUserInputNumbers(message);
    }
    return userInput;
  }

  static String formatCnpj(String cnpj) {
    String parsedCnpj = cnpj.toString();
    return '${parsedCnpj.substring(0, 2)}.${parsedCnpj.substring(2, 5)}.${parsedCnpj.substring(5, 8)}/${parsedCnpj.substring(8, 12)}-${parsedCnpj.substring(12)}';
  }

  static String pesquisaPorCnpj(List<Empresa> list) {
    String message;
    String cnpj = formatCnpj(validateNumber('Infome o CNPJ: ', 14));
    try {
      Empresa empresaSelecionada = list.where((e) => e.cnpj == cnpj).first;
      message = getEmpresa(empresaSelecionada);
    } catch (e) {
      stdout.write('CNPJ Inválido...\n');
      message = pesquisaPorCnpj(list);
    }
    return message;
  }

  static String formatCpf(String cpf) {
    return '${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9)}';
  }

  static String validateNumber(String message, int lenght) {
    String number = Helper.getUserInputNumbers(message);
    if (number.toString().length != lenght) {
      stdout.write('Número inválido!\n');
      number = validateNumber(message, lenght);
    }
    return number;
  }

  static void ordenaRazaoSocial(List<Empresa> list) {
    list.sort((a, b) => (a.nomeFantasia
        .toLowerCase()
        .split(' ')
        .first
        .compareTo(b.nomeFantasia.toLowerCase().split(' ').first)));
  }

  static void printaEmpresas(List<Empresa> list) {
    list.forEach((element) => print(getEmpresa(element)));
  }

  static String pesquisaPorDocumento(List<Empresa> list) {
    final Empresa empresaSelecionada;
    String message = '';
    String documento =
        Helper.getUserInputNumbers('Insira o número de CPF/CNPJ do sócio: ');
    try {
      if (documento.toString().length == 11) {
        empresaSelecionada = list
            .where((e) => e.socio.documento == Helper.formatCpf(documento))
            .single;
        message = getEmpresa(empresaSelecionada);
      } else if (documento.toString().length == 14) {
        empresaSelecionada = list
            .where((e) => e.socio.documento == Helper.formatCnpj(documento))
            .single;
        message = getEmpresa(empresaSelecionada);
      }
    } catch (e) {
      stdout.write('CPF/CNPJ Inválido\n');
      message = pesquisaPorDocumento(list);
    }
    return message;
  }

  static String formatCep(String cep) {
    return '${cep.substring(0, 2)}-${cep.substring(2)}';
  }

  static String formatTelefone(String telefone) {
    String parsedTelefone = telefone.toString();
    return '(${parsedTelefone.substring(0, 2)}) ${parsedTelefone.substring(2, 3)} ${parsedTelefone.substring(3, 7)}-${parsedTelefone.substring(7)}';
  }

  static Socio criarSocio() {
    Socio socio;
    String option = Helper.getUserInputNumbers(
        '========================\nCadastrando Socio:\n========================\nPara pessoa física digite: 1\nPara pesoa jurídica digite: 2\nSua opção: ');
    if (option == '1') {
      socio = PessoaFisica(
        Endereco(
            Helper.getUserInput('Informe o Logradouro do Sócio: '),
            Helper.getUserInputNumbers('Informe o número: '),
            Helper.getUserInput('Informe o complemento: '),
            Helper.formatCep(
                Helper.validateNumber('Informe o CEP(Apenas números): ', 8)),
            Helper.getUserInput('Informe o bairro: '),
            Helper.getUserInput('Informe o estado: ')),
        Helper.getUserInput('Informe o nome completo: '),
        Helper.formatCpf(validateNumber('Infome o CPF: ', 11)),
      );
    } else if (option == '2') {
      socio = PessoaJuridica(
        Endereco(
            Helper.getUserInput('Informe o Logradouro do Sócio: '),
            Helper.getUserInputNumbers('Informe o número: '),
            Helper.getUserInput('Informe o complemento: '),
            Helper.formatCep(
                Helper.validateNumber('Informe o CEP(Apenas números): ', 8)),
            Helper.getUserInput('Informe o bairro: '),
            Helper.getUserInput('Informe o estado: ')),
        Helper.getUserInput('Informe o nome fantasia: '),
        Helper.formatCpf(validateNumber('Infome o CNPJ do Sócio: ', 14)),
        Helper.getUserInput('Informe a razão social'),
      );
    } else {
      stdout.write('Opção inválida! Tente novamente \n');
      socio = criarSocio();
    }
    return socio;
  }

  static String getEndereco(Endereco endereco) =>
      'Endereço: ${endereco.logradouro}, ${endereco.numero}, ${endereco.complemento}, ${endereco.bairro}/${endereco.estado}, ${endereco.cep}';

  static String getEmpresa(Empresa empresa) =>
      'ID: ${empresa.id}\nCNPJ:  ${empresa.cnpj} Data Cadastro: ${empresa.dataCriacao}\nRazão Social: ${empresa.razaoSocial}\n Nome Fantasia: ${empresa.nomeFantasia}\nTelefone: ${empresa.telefone}\n${getEndereco(empresa.endereco)}\n${empresa.socio.getSocio()}';
}
