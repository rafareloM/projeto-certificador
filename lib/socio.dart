import 'package:meta/meta.dart';
import 'package:projeto_certificador/endereco.dart';

abstract class Socio {
  @protected
  final Endereco pEndereco;
  @protected
  final String pNome;
  @protected
  final String pDocumento;
  String get documento => pDocumento;
  String get nome => pNome;
  Endereco get endereco => pEndereco;
  Socio(this.pEndereco, this.pNome, this.pDocumento);

  getSocio() {}
}
