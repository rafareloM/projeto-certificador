import 'package:projeto_certificador/endereco.dart';
import 'package:projeto_certificador/helper.dart';
import 'package:projeto_certificador/socio.dart';

class PessoaFisica extends Socio {
  final String _cpf;
  String get cpf => _cpf;
  PessoaFisica(Endereco endereco, String nomeCompleto, this._cpf)
      : super(endereco, nomeCompleto, _cpf);
  @override
  String getSocio() {
    return 'Sócio:\nCPF: $documento\nNome Completo: $nome\n${Helper.getEndereco(endereco)}';
  }
}
