import 'package:projeto_certificador/helpers/format.dart';

class Endereco {
  final String _logradouro;
  final String _numero;
  final String _complemento;
  final String _bairro;
  final String _estado;
  final String _cep;

  get logradouro {
    return _logradouro;
  }

  get numero {
    return _numero;
  }

  get complemento {
    return _complemento;
  }

  get bairro {
    return _bairro;
  }

  get estado {
    return _estado;
  }

  get cep {
    return _cep;
  }

  static String getEndereco(Endereco endereco) =>
      'Endereço: ${endereco.logradouro}, ${endereco.numero}, ${endereco.complemento}, ${endereco.bairro}/${endereco.estado}, ${Format.formatCep(endereco.cep)}';

  Endereco(
    this._logradouro,
    this._numero,
    this._complemento,
    this._cep,
    this._bairro,
    this._estado,
  );
}
