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

  Empresa(super.endereco, super.pNomeFantasia, super.pCnpj, super.pRazaoSocial,
      this._telefone, this._socio);
}
