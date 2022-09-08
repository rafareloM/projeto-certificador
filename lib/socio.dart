import 'package:meta/meta.dart';
import 'package:projeto_certificador/endereco.dart';

abstract class Socio {
  @protected
  late Endereco endereco = Endereco();
  @protected
  late String nome;
  @protected
  late String documento;
  setNome() {}
  setDocumento() {}
  setSocio() {}
  getSocio() {}
}
