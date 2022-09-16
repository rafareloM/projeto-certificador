import 'package:meta/meta.dart';
import 'package:projeto_certificador/endereco.dart';
import 'package:projeto_certificador/socio.dart';

class PessoaJuridica extends Socio {
  @protected
  final String pRazaoSocial;
  @protected
  final String pCnpj;
  @protected
  final String pNomeFantasia;

  String get cnpj => pCnpj;

  String get razaoSocial => pRazaoSocial;

  String get nomeFantasia => pNomeFantasia;

  PessoaJuridica(
    Endereco endereco,
    this.pNomeFantasia,
    this.pCnpj,
    this.pRazaoSocial,
  ) : super(
          endereco,
          pNomeFantasia,
          pCnpj,
        );
  @override
  String getSocio() =>
      'Sócio:\nCPF: $documento\nRazão Social: $razaoSocial\nNome Fantasia: $nome\n${Endereco.getEndereco(endereco)}';
}
