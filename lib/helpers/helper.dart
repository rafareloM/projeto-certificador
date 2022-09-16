import 'dart:io';
import 'package:projeto_certificador/empresa.dart';
import 'package:projeto_certificador/endereco.dart';
import 'package:projeto_certificador/helpers/format.dart';
import 'package:projeto_certificador/helpers/input.dart';
import 'package:projeto_certificador/pessoa_fisica.dart';
import 'package:projeto_certificador/pessoa_juridica.dart';
import 'package:projeto_certificador/socio.dart';

class Helper {
  static String pesquisaPorCnpj(List<Empresa> list) {
    String message;
    String cnpj = Format.formatCnpj(validateNumber('Infome o CNPJ: ', 14));
    try {
      Empresa empresaSelecionada = list.where((e) => e.cnpj == cnpj).first;
      message = Empresa.getEmpresa(empresaSelecionada);
    } catch (e) {
      stdout.write('CNPJ Inválido...\n');
      message = pesquisaPorCnpj(list);
    }
    return message;
  }

  static String validateNumber(String message, int lenght) {
    String number = Input.getUserInputNumbers(message);
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

  static String pesquisaPorDocumento(List<Empresa> list) {
    final Empresa empresaSelecionada;
    String message = '';
    String documento =
        Input.getUserInputNumbers('Insira o número de CPF/CNPJ do sócio: ');
    try {
      if (documento.toString().length == 11) {
        empresaSelecionada = list
            .where((e) => e.socio.documento == Format.formatCpf(documento))
            .single;
        message = Empresa.getEmpresa(empresaSelecionada);
      } else if (documento.toString().length == 14) {
        empresaSelecionada = list
            .where((e) => e.socio.documento == Format.formatCnpj(documento))
            .single;
        message = Empresa.getEmpresa(empresaSelecionada);
      }
    } catch (e) {
      stdout.write('CPF/CNPJ Inválido\n');
      message = pesquisaPorDocumento(list);
    }
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
            Format.formatCep(
                Helper.validateNumber('Informe o CEP(Apenas números): ', 8)),
            Input.getUserInput('Informe o bairro: '),
            Input.getUserInput('Informe o estado: ')),
        Input.getUserInput('Informe o nome completo: '),
        Format.formatCpf(validateNumber('Infome o CPF: ', 11)),
      );
    } else if (option == '2') {
      socio = PessoaJuridica(
        Endereco(
            Input.getUserInput('Informe o Logradouro do Sócio: '),
            Input.getUserInputNumbers('Informe o número: '),
            Input.getUserInput('Informe o complemento: '),
            Format.formatCep(
                Helper.validateNumber('Informe o CEP(Apenas números): ', 8)),
            Input.getUserInput('Informe o bairro: '),
            Input.getUserInput('Informe o estado: ')),
        Input.getUserInput('Informe o nome fantasia: '),
        Format.formatCpf(validateNumber('Infome o CNPJ do Sócio: ', 14)),
        Input.getUserInput('Informe a razão social'),
      );
    } else {
      stdout.write('Opção inválida! Tente novamente \n');
      socio = criarSocio();
    }
    return socio;
  }
}
