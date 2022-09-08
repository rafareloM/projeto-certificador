import 'dart:io';

import 'package:projeto_certificador/endereco.dart';
import 'package:projeto_certificador/input.dart';
import 'package:projeto_certificador/pessoa_fisica.dart';
import 'package:projeto_certificador/pessoa_juridica.dart';
import 'package:projeto_certificador/socio.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Empresa {
  final Endereco _endereco = Endereco();
  final _id = uuid.v4();
  final _dataCriacao = DateTime.now();
  late String _telefone;
  late String _razaoSocial;
  late String _nomeFantasia;
  late Socio _socio;
  late String _cnpj;

  static Iterable<Empresa> pesquisaPorCnpj(List<Empresa> list) {
    String cnpj = PessoaJuridica.validaCnpj('para pesquisar ');
    return list.where((e) => e.cnpj == cnpj);
  }

  static Iterable<Empresa> pesquisaPorDocumento(List<Empresa> list) {
    late Iterable<Empresa> empresaSelecionada;
    String documento = Input.getUserInputToIntPossibleZero(
        'Insira o número de CPF/CNPJ do sócio: ');
    if (documento.toString().length == 11) {
      empresaSelecionada = list
          .where((e) => e.socio.documento == PessoaFisica.formatCpf(documento));
    } else if (documento.toString().length == 14) {
      empresaSelecionada = list.where(
          (e) => e.socio.documento == PessoaJuridica.formatCnpj(documento));
    } else {
      stdout.write('CPF/CNPJ Inválido\nada');
      empresaSelecionada = pesquisaPorDocumento(list);
    }
    return empresaSelecionada;
  }

  get id => _id;

  get dataCriacao => _dataCriacao;

  void setCnpj() {
    _cnpj = PessoaJuridica.validaCnpj('da Empresa ');
  }

  get cnpj => _cnpj;

  void setSocioEmpresa() {
    int option = Input.getUserInputToInt(
        'Cadastrando Socio:\nPara pessoa física digite: 1\nPara pesoa jurídica digite: 2\nSua opção: ');
    switch (option) {
      case 1:
        _socio = PessoaFisica();
        _socio.setSocio();
        break;
      case 2:
        _socio = PessoaJuridica();
        _socio.setSocio();
        break;
      default:
        stdout.write('Opção inválida! Tente novamente \n');
        setSocioEmpresa();
        break;
    }
  }

  get socio => _socio;

  String formatTelefone(int telefone) {
    String parsedTelefone = telefone.toString();
    return '(${parsedTelefone.substring(0, 2)}) ${parsedTelefone.substring(2, 3)} ${parsedTelefone.substring(3, 7)}-${parsedTelefone.substring(7)}';
  }

  String validaTelefone() {
    int telefone = Input.getUserInputToInt(
        'Informe o Número de Telefone(Apenas números): ');
    while (telefone.toString().length != 11) {
      stdout.write('Número de Telefone inválido\n');
      telefone = Input.getUserInputToInt(
          'Informe o Número de Telefone(Apenas números): ');
    }
    return formatTelefone(telefone);
  }

  void setTelefone() {
    _telefone = validaTelefone();
  }

  get telefone => _telefone;

  void setRazaoSocial() {
    _razaoSocial = Input.getUserInput('Informe a Razão Social da Empresa: ');
  }

  get razaoSocial => _razaoSocial;

  void setNomeFantasia() {
    _nomeFantasia = Input.getUserInput('Informe o Nome Fantasia: ');
  }

  get nomeFantasia => _nomeFantasia;

  get endereco => _endereco;

  setEmpresa() {
    _endereco.setEndereco('da Empresa');
    setCnpj();
    setNomeFantasia();
    setRazaoSocial();
    setTelefone();
    setSocioEmpresa();
  }

  String getEmpresa() {
    return 'ID: $_id\nCNPJ:  $_cnpj Data Cadastro: $_dataCriacao\nRazão Social: $_razaoSocial\n Nome Fantasia: $_nomeFantasia\nTelefone: $_telefone\n${_endereco.getEndereco()}\n${_socio.getSocio()}';
  }
}
