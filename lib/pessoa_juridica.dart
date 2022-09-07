import 'package:projeto_certificador/input.dart';
import 'package:projeto_certificador/socio.dart';

class PessoaJuridica extends Socio {
  late String _cnpj;
  late String _razaoSocial;
  void setnome() {
    nome = Input.getUserInput('Informe o Nome Fantasia: ');
  }

  String formatCnpj(int cnpj) {
    String parsedCnpj = cnpj.toString();
    return '${parsedCnpj.substring(0, 2)}.${parsedCnpj.substring(2, 5)}.${parsedCnpj.substring(5, 8)}/${parsedCnpj.substring(8, 12)}-${parsedCnpj.substring(12)}';
  }

  void setRazaoSocial() {
    _razaoSocial = Input.getUserInput('Informe o razaoSocial: ');
  }

  get razaoSocial {
    return _razaoSocial;
  }

  void setcnpj() {
    _cnpj = formatCnpj(Input.getUserInputToInt('Informe o cnpj: '));
  }

  get cnpj {
    return _cnpj;
  }

  @override
  String getSocio() {
    return 'Sócio:\nCPF: $cnpj\nRazão Social: \nNome Fantasia: $nome\nEndereço: ${endereco.getEndereco()}';
  }
}
