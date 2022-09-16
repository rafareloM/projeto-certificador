import 'package:projeto_certificador/endereco.dart';
import 'package:projeto_certificador/helpers/format.dart';
import 'package:projeto_certificador/pessoa_juridica.dart';
import 'package:projeto_certificador/socio.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Empresa extends PessoaJuridica {
  final _id = uuid.v4();
  final _dataCriacao = DateTime.now();
  final String _telefone;
  final Socio _socio;

  get id => _id;

  get dataCriacao => _dataCriacao;

  set socio(Socio socio) => socio = _socio;

  Socio get socio => _socio;

  get telefone => _telefone;

  static String getEmpresa(Empresa empresa) =>
      'ID: ${empresa.id}\nCNPJ:  ${Format.formatCnpj(empresa.cnpj)} Data Cadastro: ${empresa.dataCriacao}\nRazão Social: ${empresa.razaoSocial}\nNome Fantasia: ${empresa.nomeFantasia}\nTelefone: ${Format.formatTelefone(empresa.telefone)}\n${Endereco.getEndereco(empresa.endereco)}\n${empresa.socio.getSocio()}\n=======================================\n';

  Empresa(super.endereco, super.pNomeFantasia, super.pCnpj, super.pRazaoSocial,
      this._telefone, this._socio);
}
