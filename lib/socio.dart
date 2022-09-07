import 'package:meta/meta.dart';
import 'package:projeto_certificador/endereco.dart';
import 'package:projeto_certificador/input.dart';

abstract class Socio {
  Endereco endereco = Endereco();
  @protected
  late String nome;
  @protected
  late String documento;
  void setNome() {
    nome = Input.getUserInput('Informe o nome: ');
  }

  getSocio() {}
}
