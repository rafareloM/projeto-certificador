import 'package:projeto_certificador/empresa.dart';
import 'package:projeto_certificador/input.dart';
import 'package:projeto_certificador/pessoa_fisica.dart';
import 'package:projeto_certificador/socio.dart';
import 'package:projeto_certificador/template.dart';

void main() {
  Empresa empresa = Empresa();
  List<Empresa> list = [empresa];

  empresa.setCnpj();
  print(Empresa.pesquisaPorCnpj(list).first.getEmpresa());
}
