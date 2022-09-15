import 'package:projeto_certificador/empresa.dart';
import 'package:projeto_certificador/endereco.dart';
import 'package:projeto_certificador/helper.dart';
import 'package:projeto_certificador/pessoa_fisica.dart';
import 'package:projeto_certificador/template.dart';

void main() {
  List<Empresa> list = [];
  Empresa empresa = Empresa(
    Endereco(
      '',
      '',
      '',
      '',
      '',
      '',
    ),
    'Pães e Doces',
    '11.941.838/0001-04',
    'Elisa e Flávia Pães e Doces ME',
    '(19) 9 8838-0630',
    PessoaFisica(
        Endereco(
          '',
          '',
          '',
          '',
          '',
          '',
        ),
        'Mirella Kamilly Letícia Barbosa',
        '763.679.800-08'),
  );
  list.add(empresa);
  print(Helper.pesquisaPorCnpj(list));
}
